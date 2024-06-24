import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, IconButton, Menu, MenuItem, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from "@mui/material";
import { Fragment, useEffect, useState } from "react";
import SalesService from "src/_cores/_services/sales.service";
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import DeleteOutlineIcon from '@mui/icons-material/DeleteOutline';

export default function PaymentMethod() {
    const [open, setOpen] = useState(false);
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const openDel = Boolean(delAnchorEl);
    const [banks, setBanks] = useState<any>([]);
    const [formData, setFormData] = useState({
        bankId: -1,
        bankName: '',
        bankAccountNumber: '',
        bankAccountName: '',
    });

    useEffect(() => {
        getData();
    }, []);

    const handleClose = () => {
        setFormData({
            ...formData,
            bankId: -1,
            bankName: '',
            bankAccountNumber: '',
            bankAccountName: '',
        });
        setOpen(false);
    };

    const handleChange = (e: any) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value,
        });
    };

    const handleClickOpen = () => {
        setOpen(true);
    };

    const viewDetail = (data: any) => {
        setFormData({
            bankId: data.bankId,
            bankName: data.bankName,
            bankAccountName: data.bankAccountName,
            bankAccountNumber: data.bankAccountNumber,
        })
        handleClickOpen();
    }

    const deleteData = async (id: number) => {
        const res = await SalesService.deletePaymentMethod(id) as any;
        if (res?.isSucceed) {
            await getData();
        }
        handleClose();
        setDelAnchorEl(null);
    }

    const handleSubmit = async (e: any) => {
        e.preventDefault();
        const res = await SalesService.savePaymentMethod(formData) as any;
        if (res?.isSucceed) {
            await getData();
        }
        handleClose();
    };

    const getData = async () => {
        const res = await SalesService.getPaymentMethods() as any;
        if (res?.isSucceed) {
            setBanks(res.data);
        }
    }

    return (
        <Fragment>
            <Box>
                <Grid container spacing={2} sx={{ marginBottom: 2 }}>
                    <Grid item xs={12} sm={12}>
                        <Button variant="contained" sx={{ marginRight: 2 }} onClick={handleClickOpen}>Thêm</Button>
                    </Grid>
                </Grid>
            </Box>
            <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
                <Table aria-label="collapsible table">
                    <TableHead>
                        <TableRow>
                            <TableCell>Ngân hàng</TableCell>
                            <TableCell>Số tài khoản</TableCell>
                            <TableCell>Tên</TableCell>
                            <TableCell></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {banks.map((_: any) => (
                            <TableRow key={_.bankId} sx={{ '& > *': { borderBottom: 'unset' } }}>
                                <TableCell>{_.bankName}</TableCell>
                                <TableCell>{_.bankAccountNumber}</TableCell>
                                <TableCell>{_.bankAccountName}</TableCell>
                                <TableCell>
                                    <IconButton
                                        size="small"
                                        onClick={() => viewDetail(_)}
                                    >
                                        <ModeEditIcon />
                                    </IconButton>

                                    <IconButton
                                        size="small"
                                        aria-haspopup="true"
                                        aria-controls={openDel ? 'basic-menu' : undefined}
                                        aria-expanded={openDel ? 'true' : undefined}
                                        onClick={(event) => setDelAnchorEl(event.currentTarget)}
                                    >
                                        <DeleteOutlineIcon />
                                    </IconButton>
                                    <Menu
                                        anchorEl={delAnchorEl}
                                        open={openDel}
                                        onClose={() => setDelAnchorEl(null)}
                                        MenuListProps={{ 'aria-labelledby': 'basic-button' }}
                                    >
                                        <MenuItem onClick={() => deleteData(_.bankId)}>Xác nhận xóa</MenuItem>
                                        <MenuItem onClick={() => setDelAnchorEl(null)}>Hủy</MenuItem>
                                    </Menu>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>

            <Dialog
                fullWidth={true}
                open={open}
                onClose={handleClose}
                PaperProps={{ style: { height: '80vh' } }}
            >
                <Box component={'form'} onSubmit={handleSubmit}>
                    <DialogTitle>Chi tiết</DialogTitle>
                    <DialogContent>
                        <TextField
                            required
                            margin="dense"
                            name="bankName"
                            label="Tên ngân hàng"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData.bankName || ''}
                            onChange={(e) => handleChange(e)}
                        />
                        <TextField
                            required
                            margin="dense"
                            name="bankAccountNumber"
                            label="Số tài khoản"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData.bankAccountNumber || ''}
                            onChange={handleChange}
                        />
                        <TextField
                            required
                            margin="dense"
                            name="bankAccountName"
                            label="Tên"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData.bankAccountName || ''}
                            onChange={handleChange}
                        />
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={handleClose}>Đóng</Button>
                        <Button type="submit">Xác nhận</Button>
                    </DialogActions>
                </Box>
            </Dialog>
        </Fragment>
    )
}