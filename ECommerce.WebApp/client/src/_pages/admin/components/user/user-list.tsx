import IconButton from "@mui/material/IconButton";
import Paper from "@mui/material/Paper";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import { useState, useEffect, Fragment, FormEvent } from "react";
import UserService from "src/_cores/_services/user.service";
import { IUserGetParam } from "../../interfaces/user-interface";
import { UserHelper } from "src/_shares/_helpers/user-helper";
import { DateTimeHelper } from "src/_shares/_helpers/datetime-helper";
import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
import { Autocomplete, Box, Button, Grid, Menu, MenuItem, Pagination, TextField } from "@mui/material";
import { useNavigate } from "react-router-dom";
import { ADMIN_ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { ITableHeader } from "src/_shares/_components/data-table/data-table";
import { api } from "src/_cores/_api/api";
import { ROLES } from "src/_cores/_constants/role-constants";

type TableRowProps = {
    rowData: any,
    onUpdateStatus: (id: number, status: boolean) => void,
}

function Row(props: TableRowProps) {
    const { rowData, onUpdateStatus } = props;
    const navigate = useNavigate();
    const [open, setOpen] = useState(false);
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const openDel = Boolean(delAnchorEl);

    const handleClickDel = (event: React.MouseEvent<HTMLButtonElement>) => {
        setDelAnchorEl(event.currentTarget);
    };

    const handleCloseDel = () => {
        setDelAnchorEl(null);
    };

    const userIsActived = (isActived: boolean) => UserHelper.userIsActived(isActived);

    const deleteUser = async (id: number) => {
        if (window.confirm("Xác nhận xóa ?")) {
            const res = await api.delete(`/user/delete-user/${id}`) as any;
            if (res.isSucceed) window.location.reload();
        }
    }

    const viewDetail = (id: number) => {
        navigate({
            pathname: ADMIN_ROUTE_NAME.MANAGE_USER_DETAIL,
            search: `?id=${id}`
        });
    }

    const userAddress = (user: any): string => {
        let address = user.userAddress ?? "";
        if (user.userWardName) {
            address += `, ${user.userWardName}`;
        }
        if (user.userDistrictName) {
            address += `, ${user.userDistrictName}`;
        }
        if (user.userCityName) {
            address += `, ${user.userCityName}`;
        }
        return address;
    }

    return (
        <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
            <TableCell>
                <IconButton onClick={() => viewDetail(rowData.userId)}>
                    <InfoOutlinedIcon />
                </IconButton>
            </TableCell>
            <TableCell>
                {DateTimeHelper.getDateTimeFormated(rowData.userJoinDate)}
            </TableCell>
            <TableCell>{rowData.userFullName}</TableCell>
            <TableCell>{userAddress(rowData)}</TableCell>
            <TableCell>{rowData.userMail}</TableCell>
            <TableCell>{rowData.userPhone}</TableCell>
            <TableCell align="center" sx={{ color: userIsActived(rowData.isActived).color }}>
                {userIsActived(rowData.isActived).label}
            </TableCell>
            <TableCell align="center">
                <Button
                    onClick={() => onUpdateStatus(rowData.userId, true)}
                    variant="outlined"
                    color="success"
                >
                    Hiện
                </Button>
                <Button
                    onClick={() => onUpdateStatus(rowData.userId, false)}
                >
                    Ẩn
                </Button>
                <Button
                    variant="outlined"
                    color="error"
                    aria-controls={openDel ? 'basic-menu' : undefined}
                    aria-haspopup="true"
                    aria-expanded={openDel ? 'true' : undefined}
                    onClick={() => deleteUser(rowData.userId)}
                >
                    Xóa
                </Button>
            </TableCell>
        </TableRow>
    );
}

export default function UserList() {
    const [params, setParams] = useState<any>({
        keyword: null,
        roleKey: null,
        pageIndex: 1,
        pageSize: 10,
        totalPage: 1,
    });
    const [users, setUsers] = useState([]);

    useEffect(() => {
        getData(params);
    }, []);

    const onSearch = (event: FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        const form = new FormData(event.currentTarget);
        const _params = {
            ...params,
            keyword: form.get('keyword'),
            roleKey: form.get('roleKey'),
        }
        setParams(_params);
        getData(_params);
    }

    const getData = (param: any) => {
        UserService.getUserList(param).then((res: any) => {
            if (res.isSucceed) {
                setUsers(res.data.items || []);
                const _params = {
                    ...param,
                    pageIndex: res.data.currentPage,
                    totalPage: res.data.totalPage
                }
                setParams(_params);
            }
        }).catch(error => {
            console.log(error);
        })
    }

    const updateStatus = async (id: number, isActived: boolean) => {
        const _params = {
            id: id,
            isActived: isActived
        }
        const res = await UserService.updateUserStatus(_params);
        if (res) {
            getData(params);
        }
    }

    const pageChange = (event: any, pageIndex: number) => {
        const _params = { ...params, pageIndex: pageIndex || 1 };
        setParams(_params);
        getData(_params);
    }

    const onChangeRole = async (roleKey?: string) => {
        const _params = { ...params, roleKey: roleKey || '' };
        setParams(_params);
        getData(_params);
    }

    const header: ITableHeader[] = [
        { field: 'joinDate', fieldName: 'Ngày tham gia', align: 'left' },
        { field: 'name', fieldName: 'Tên', align: 'left' },
        { field: 'address', fieldName: 'Địa chỉ', align: 'left' },
        { field: 'email', fieldName: 'Email', align: 'left' },
        { field: 'phone', fieldName: 'Số điện thoại', align: 'left' },
        { field: 'status', fieldName: 'Trạng thái', align: 'center' },
        { field: '', fieldName: '', align: 'center' },
    ];

    return (
        <Fragment>
            <Box component='form' onSubmit={onSearch}>
                <Grid container spacing={2} sx={{ marginBottom: 2 }}>
                    <Grid item xs={12} sm={4}>
                        <TextField
                            onChange={(event) => setParams({ ...params, keyword: event?.target.value ?? '' })}
                            autoComplete='off'
                            name="keyword"
                            fullWidth
                            size="small"
                            label="Tên / Số điện thoại"
                            autoFocus
                        />
                    </Grid>
                    <Grid item xs={12} sm={4}>
                        <Autocomplete
                            size="small"
                            disablePortal
                            value={ROLES.find(_ => _.code === params.roleKey) ?? null}
                            options={ROLES}
                            renderInput={(params) => <TextField {...params} name="roleKey" label="Vai trò" />}
                            getOptionLabel={(option: any) => option.name}
                            onChange={(event, value) => onChangeRole(value?.code)}
                        />
                    </Grid>
                    <Grid item xs={12} sm={12}>
                        <Button type="submit" variant="contained" sx={{ marginRight: 2 }}>Tìm kiếm</Button>
                    </Grid>
                </Grid>
            </Box>
            <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
                <Table aria-label="collapsible table">
                    <TableHead>
                        <TableRow>
                            <TableCell />
                            {header.map((field) => (
                                <TableCell key={field.field} align={!field.align ? 'left' : field.align}>{field.fieldName}</TableCell>
                            ))}
                            <TableCell />
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {users.length > 0 && users.map((item: any, idx) => (
                            <Row
                                key={`row-${item.userId}`}
                                rowData={item}
                                onUpdateStatus={(id, status) => updateStatus(id, status)}
                            />
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <Pagination
                variant="outlined"
                shape="rounded"
                page={params.pageIndex}
                count={params.totalPage}
                onChange={pageChange}
            />
        </Fragment>
    );
}