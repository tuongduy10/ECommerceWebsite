import { Autocomplete, Box, Button, Checkbox, Dialog, DialogActions, DialogContent, DialogTitle, FormControlLabel, FormLabel, Grid, IconButton, Menu, MenuItem, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from "@mui/material";
import { Fragment, useEffect, useRef, useState } from "react";
import CheckBoxOutlineBlankIcon from '@mui/icons-material/CheckBoxOutlineBlank';
import CheckBoxIcon from '@mui/icons-material/CheckBox';
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import DeleteOutlineIcon from '@mui/icons-material/DeleteOutline';
import { ENV } from "src/_configs/enviroment.config";
import InventoryService from "src/_cores/_services/inventory.service";
import { ICategory } from "src/_cores/_interfaces/inventory.interface";
import UploadInput from "src/_shares/_components/input/upload-input";
import { Editor } from "@tinymce/tinymce-react";
import { GlobalConfig } from "src/_configs/global.config";
import { api } from "src/_cores/_api/api";
import { INVENTORY_API_URL, SALES_API_URL } from "src/_cores/_enums/api-url.enum";
import { DateTimeHelper } from "src/_shares/_helpers/datetime-helper";

const icon = <CheckBoxOutlineBlankIcon fontSize="small" />;
const checkedIcon = <CheckBoxIcon fontSize="small" />;

const ShopList = () => {
    const editorRef = useRef<any>(null);
    const [open, setOpen] = useState(false);
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const openDel = Boolean(delAnchorEl);
    const uploadRef = useRef<any>();

    const [brands, setBrands] = useState([]);
    const [shops, setShops] = useState([]);
    const [formData, setFormData] = useState<{ [key: string]: any }>();

    useEffect(() => {
        async function getBrands() {
            const res = await InventoryService.getBrands({}) as any;
            if (res?.isSucceed) {
                setBrands(res.data);
            }
        }
        getBrands();
        getData();
    }, []);

    const handleClose = () => {
        setFormData({});
        setOpen(false);
    };

    const handleChange = (e: any) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value,
        });
    };

    const onChangeFiles = (files: string[]) => {
        console.log(files);
        setFormData({ ...formData, imagePath: files[0] ?? '' });
    }

    const onChangeBrands = (items: any[]) => {
        const _ids = items.map(_ => _.id);
        setFormData({ ...formData, shopBrands: _ids });
    }

    const handleClickOpen = () => {
        setOpen(true);
    };

    const viewDetail = async (id: number) => {
        const res = await api.get(SALES_API_URL.GET_SHOP + `/${id}`) as any;
        if (res) {
            const dataDetail = res as any;
            setFormData(dataDetail);
            handleClickOpen();
        }
    }

    const deleteData = async (id: number) => {
        const res = await api.post(INVENTORY_API_URL.DELETE_BRAND, id) as any;
        if (res?.isSucceed) {
            await getData();
        }
        handleClose();
        setDelAnchorEl(null);
    }

    const onChangeIsHighlight = (event: any) => {
        setFormData({ ...formData, isHighlight: event.target.checked });
    }

    const handleSubmit = async (e: any) => {
        e.preventDefault();
        const params = {
            ...formData,
            id: formData?.shopId,
            name: formData?.shopName,
            brandIds: formData?.shopBrands || [],
        }
        const url = formData?.shopId > -1
            ? SALES_API_URL.UPDATE_SHOP
            : SALES_API_URL.ADD_SHOP;
        const res = await api.post(url, params) as any
        if (res?.isSucceed)
            await getData();
        handleClose();
    };

    const getData = async () => {
        const res = await api.get(SALES_API_URL.GET_SHOPS) as any;
        if (res) {
            setShops(res);
        }
    }

    const closeDialogAndRemoveFiles = () => {
        handleClose();
        if (uploadRef.current) {
            //uploadRef.current.removeAllFiles();
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
                            <TableCell>Ngày tham gia</TableCell>
                            <TableCell>Tên</TableCell>
                            <TableCell></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {shops.map((_: any) => (
                            <TableRow key={_.shopId} sx={{ '& > *': { borderBottom: 'unset' } }}>
                                <TableCell>{DateTimeHelper.getDateTimeFormated(_.shopJoinDate)}</TableCell>
                                <TableCell>{_.shopName}</TableCell>
                                <TableCell>
                                    <IconButton
                                        size="small"
                                        onClick={() => viewDetail(_.shopId)}
                                    >
                                        <ModeEditIcon />
                                    </IconButton>
                                    {/* <IconButton
                                        size="small"
                                        aria-haspopup="true"
                                        aria-controls={openDel ? 'basic-menu' : undefined}
                                        aria-expanded={openDel ? 'true' : undefined}
                                        onClick={() => deleteData(_.shopId)}
                                    //onClick={(event) => setDelAnchorEl(event.currentTarget)}
                                    >
                                        <DeleteOutlineIcon />
                                    </IconButton> */}
                                    <Menu
                                        anchorEl={delAnchorEl}
                                        open={openDel}
                                        onClose={() => setDelAnchorEl(null)}
                                        MenuListProps={{ 'aria-labelledby': 'basic-button' }}
                                    >
                                        <MenuItem onClick={() => deleteData(_.shopId)}>Xác nhận xóa</MenuItem>
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
                onClose={closeDialogAndRemoveFiles}
                PaperProps={{ style: { height: '80vh' } }}
            >
                <Box component={'form'} onSubmit={handleSubmit}>
                    <DialogTitle>Chi tiết</DialogTitle>
                    <DialogContent>
                        <TextField
                            required
                            margin="dense"
                            name="shopName"
                            label="Tên cửa hàng"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData?.shopName || ''}
                            onChange={(e) => handleChange(e)}
                        />
                        <Autocomplete
                            multiple
                            id="checkboxes-tags-demo"
                            options={brands}
                            disableCloseOnSelect
                            getOptionLabel={(item: any) => `${item.id} - ${item.name}`}
                            //getOptionDisabled={(option) => option.user !== null && option.user.id !== formData['id']}
                            value={brands.length > 0 && formData?.shopBrands ? brands.filter((item: any) => formData?.shopBrands.includes(item.id)) : []}
                            renderOption={(props, item: any, { selected }) => (
                                <li {...props}>
                                    <Checkbox
                                        icon={icon}
                                        checkedIcon={checkedIcon}
                                        style={{ marginRight: 8 }}
                                        checked={selected}
                                        size="small"
                                    />
                                    {item.id} - {item.name}
                                </li>
                            )}
                            renderInput={(params) => (
                                <TextField {...params} label="Danh mục" placeholder="Chọn danh mục" size="small" />
                            )}
                            onChange={(event, items: any) => onChangeBrands(items)}
                            size="small"
                        />
                        <TextField
                            required
                            type="number"
                            margin="dense"
                            name="tax"
                            label="Chiết khấu"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData?.tax || 0}
                            onChange={(e) => handleChange(e)}
                        />
                        {/* <TextField
                            required
                            margin="dense"
                            name="shopBankName"
                            label="Tên ngân hàng"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData?.shopBank?.shopBankName || ''}
                            onChange={(e) => handleChange(e)}
                        />
                        <TextField
                            required
                            margin="dense"
                            name="shopAccountName"
                            label="Tên tài khoản"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData?.shopBank?.shopAccountName || ''}
                            onChange={(e) => handleChange(e)}
                        />
                        <TextField
                            required
                            margin="dense"
                            name="shopAccountNumber"
                            label="Số tài khoản"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData?.shopBank?.shopAccountNumber || ''}
                            onChange={(e) => handleChange(e)}
                        /> */}
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={closeDialogAndRemoveFiles}>Đóng</Button>
                        <Button type="submit">Xác nhận</Button>
                    </DialogActions>
                </Box>
            </Dialog>
        </Fragment>
    )
}

export default ShopList;