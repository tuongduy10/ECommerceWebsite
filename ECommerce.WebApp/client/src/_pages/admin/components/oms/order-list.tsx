import { Box, Button, Checkbox, Collapse, Grid, IconButton, List, ListItem, ListItemIcon, ListItemText, Menu, MenuItem, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material";
import { Fragment, useEffect, useState } from "react";
import { ITableHeader } from "src/_shares/_components/data-table/data-table";
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import OmsService from "src/_cores/_services/oms.service";
import { DateTimeHelper } from "src/_shares/_helpers/datetime-helper";
import { ProductHelper } from "src/_shares/_helpers/product-helper";
import { IPagedRequest } from "src/_cores/_interfaces";
import { FormatHelper } from "src/_shares/_helpers/format-helper";

const header: ITableHeader[] = [
    { field: 'createdDate', fieldName: 'Ngày tạo', align: 'left' },
    { field: 'createdBy', fieldName: 'Người tạo', align: 'left' },
    { field: 'totalPrice', fieldName: 'Tạm tính', align: 'left' },
    { field: 'totalFinalPrice', fieldName: 'Thành tiền', align: 'left' },
    { field: 'paymentMethod', fieldName: 'Phương thức thanh toán', align: 'left' },
    { field: 'status', fieldName: 'Trạng thái', align: 'left' },
    { field: 'action', fieldName: '', align: 'center' }
];

type TableRowProps = {
    rowData: any,
    isSelected: boolean,
    onUpdateStatus: (id: number, status: number) => void,
    onDelete: (id: number) => void,
    onSelected: (id: number) => void,
    onViewDetail: (id: number) => void,
}

function Row(props: TableRowProps) {
    const { rowData, isSelected, onUpdateStatus, onDelete, onSelected, onViewDetail } = props;
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const [open, setOpen] = useState(false);
    const openDel = Boolean(delAnchorEl);

    const getFormatedPrice = (price: number) => ProductHelper.getFormatedPrice(price);

    const updateStatus = (id: number, status: number) => {
        onUpdateStatus(id, status);
    }

    const deleteProduct = (id: number) => {
        onDelete(id);
        handleCloseDel();
    }

    const handleClickDel = (event: React.MouseEvent<HTMLButtonElement>) => {
        setDelAnchorEl(event.currentTarget);
    };

    const handleCloseDel = () => {
        setDelAnchorEl(null);
    };

    const viewDetail = (id: number) => {
        onViewDetail(id)
    }

    return (
        <Fragment>
            <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
                <TableCell>
                    <Checkbox
                        checked={isSelected}
                        onChange={() => onSelected(rowData.id)}
                        sx={{ display: 'none' }}
                    />
                    <IconButton
                        aria-label="expand row"
                        size="small"
                        onClick={() => setOpen(!open)}
                    >
                        {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
                    </IconButton>
                </TableCell>
                <TableCell align="left">{DateTimeHelper.getDateTimeFormated(rowData.createdDate)}</TableCell>
                <TableCell align="left">{rowData.createdBy}</TableCell>
                <TableCell align="left">{getFormatedPrice(rowData.totalPrice)}</TableCell>
                <TableCell align="left">{getFormatedPrice(rowData.totalFinalPrice)}</TableCell>
                <TableCell align="left">{FormatHelper.getPaymentMethod(rowData.paymentMethod)}</TableCell>
                <TableCell align="left">{FormatHelper.getOrderStatus(rowData.status)}</TableCell>
                <TableCell align="center">
                    <Button
                        variant="outlined"
                        color="error"
                        aria-controls={openDel ? 'basic-menu' : undefined}
                        aria-haspopup="true"
                        aria-expanded={openDel ? 'true' : undefined}
                        onClick={handleClickDel}
                        sx={{ display: 'none' }}
                    >
                        Xóa
                    </Button>
                    <Menu
                        anchorEl={delAnchorEl}
                        open={openDel}
                        onClose={handleCloseDel}
                        MenuListProps={{
                            'aria-labelledby': 'basic-button',
                        }}
                    >
                        <MenuItem onClick={() => deleteProduct(rowData.id)}>Xác nhận xóa</MenuItem>
                        <MenuItem onClick={handleCloseDel}>Hủy</MenuItem>
                    </Menu>
                </TableCell>
            </TableRow>
            <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
                <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={12}>
                    <Collapse in={open} timeout="auto" unmountOnExit>
                        <Box sx={{ margin: 1 }}>
                            <Grid container spacing={2} sx={{ marginBottom: 2 }}>
                                <Grid item xs={12} sm={6}>
                                    <Typography variant="h6" gutterBottom component="div">
                                        Chi tiết
                                    </Typography>
                                    <Table size="small">
                                        <TableHead>
                                            <TableRow>
                                                <TableCell>Tên</TableCell>
                                                <TableCell>Đơn giá</TableCell>
                                                <TableCell align="right">Giá đã giảm</TableCell>
                                                <TableCell align="right">Số lượng</TableCell>
                                                <TableCell align="right">Tạm tính</TableCell>
                                                <TableCell align="right">Thành tiền</TableCell>
                                            </TableRow>
                                        </TableHead>
                                        <TableBody>
                                            {rowData.orderDetails?.map((item: any) => (
                                                <TableRow key={item.productId}>
                                                    <TableCell component="th" scope="row">
                                                        {item.productName}
                                                    </TableCell>
                                                    <TableCell>{getFormatedPrice(item.price)}</TableCell>
                                                    <TableCell align="right">{getFormatedPrice(item.priceOnSell)}</TableCell>
                                                    <TableCell align="right">{item.qty}</TableCell>
                                                    <TableCell align="right">{getFormatedPrice(item.totalPrice)}</TableCell>
                                                    <TableCell align="right">{getFormatedPrice(item.totalFinalPrice)}</TableCell>
                                                </TableRow>
                                            ))}
                                        </TableBody>
                                    </Table>
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Typography variant="h6" gutterBottom component="div">
                                        Thông tin giao hàng
                                    </Typography>
                                    <Table size="small">
                                        <TableBody>
                                            <TableRow>
                                                <TableCell component="th" scope="row">Người nhận:</TableCell>
                                                <TableCell component="th" scope="row">{rowData.fullName || ''}</TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell component="th" scope="row">Số điện thoại:</TableCell>
                                                <TableCell component="th" scope="row">{rowData.phoneNumber || ''}</TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell component="th" scope="row">Địa chỉ:</TableCell>
                                                <TableCell component="th" scope="row">
                                                    {rowData.address + ', phường ' + rowData.wardName + ', quận ' + rowData.districtName + ', ' + rowData.cityName}.
                                                </TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell component="th" scope="row">Email:</TableCell>
                                                <TableCell component="th" scope="row">{rowData.email || ''}</TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell component="th" scope="row">Ghi chú:</TableCell>
                                                <TableCell component="th" scope="row">{rowData.remark || ''}</TableCell>
                                            </TableRow>
                                        </TableBody>
                                    </Table>
                                </Grid>
                            </Grid>
                        </Box>
                    </Collapse>
                </TableCell>
            </TableRow>
        </Fragment>
    );
}

export default function OrderList() {
    const [open, setOpen] = useState(false);
    const [orders, setOrders] = useState<any[]>([]);
    const [selectedOrders, setSelectedOrder] = useState<number[]>([]);

    useEffect(() => {
        search();
    }, []);

    const search = async (_params?: any) => {
        const params: IPagedRequest = {
            pageIndex: 1,
            pageSize: 10,
            searchKey: '',
        }
        const response = await OmsService.getOrdersPaging(params) as any;
        if (response?.isSucceed) {
            setOrders(response.data?.items);
        }
    }

    const temp = async (id: number, stat = 0) => {
    }

    return (
        <Fragment>
            <Box>
                <Grid container spacing={2} sx={{ marginBottom: 2 }}>
                    <Grid item xs={12} sm={4}>
                        {/* <Button variant="contained" sx={{ marginRight: 2 }}>Thêm</Button> */}
                    </Grid>
                </Grid>
            </Box>
            <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
                <Table aria-label="collapsible table">
                    <TableHead>
                        <TableRow>
                            <TableCell>
                                <Checkbox
                                    sx={{ display: 'none' }}
                                />
                            </TableCell>
                            {header.map((field) => (
                                <TableCell key={field.field} align={!field.align ? 'left' : field.align}>{field.fieldName}</TableCell>
                            ))}
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {orders.length > 0 && orders.map((item, idx) => (
                            <Row
                                key={`row-${item.id}`}
                                rowData={item}
                                isSelected={selectedOrders.includes(item.id)}
                                onUpdateStatus={(id, status) => temp(id, status)}
                                onDelete={(id) => temp(id)}
                                onSelected={(id) => temp(id)}
                                onViewDetail={(id) => temp(id)}
                            />
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
        </Fragment>
    )
}