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
import { INVENTORY_API_URL } from "src/_cores/_enums/api-url.enum";

const icon = <CheckBoxOutlineBlankIcon fontSize="small" />;
const checkedIcon = <CheckBoxIcon fontSize="small" />;

const BrandList = () => {
    const editorRef = useRef<any>(null);
    const [open, setOpen] = useState(false);
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const openDel = Boolean(delAnchorEl);
    const uploadRef = useRef<any>();

    const [brands, setBrands] = useState([]);
    const [categories, setCategories] = useState<ICategory[]>([]);
    const [formData, setFormData] = useState({
        id: -1,
        name: '',
        categoryIds: [] as any[],
        imagePath: '',
        description: '',
        descriptionTitle: '',
        isHighlight: false,
    });

    useEffect(() => {
        async function getCategories() {
            const cats = await InventoryService.getCategories() as any;
            setCategories(cats?.data);
        }
        getCategories();
        getData();
    }, []);

    const handleClose = () => {
        setFormData({
            ...formData,
            id: -1,
            name: '',
            categoryIds: [] as any[],
            imagePath: '',
            description: '',
            descriptionTitle: '',
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

    const onChangeFiles = (files: string[]) => {
        setFormData({ ...formData, imagePath: files[0] ?? '' });
    }

    const onChangeCategories = (categories: ICategory[]) => {
        const _ids = categories.map(_ => _.categoryId);
        setFormData({ ...formData, categoryIds: _ids });
    }

    const handleClickOpen = () => {
        setOpen(true);
    };

    const viewDetail = async (id: number) => {
        const res = await InventoryService.getBrand(id) as any;
        if (res?.isSucceed) {
            const cats = await InventoryService.getCategories() as any;
            const dataDetail = res?.data as any;
            if (cats?.isSucceed) {
                setFormData({
                    id: dataDetail.id,
                    name: dataDetail.name,
                    categoryIds: dataDetail.categories.map((_: ICategory) => _.categoryId),
                    imagePath: dataDetail.imagePath,
                    descriptionTitle: dataDetail.descriptionTitle,
                    description: dataDetail.description,
                    isHighlight: dataDetail.isHighlights,
                });
                setCategories(cats?.data);
                handleClickOpen();
            }
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
            description: editorRef.current.getContent(),
            isHighlight: formData['isHighlight'] || false
        }
        const url = formData.id > -1
            ? INVENTORY_API_URL.UPDATE_BRAND
            : INVENTORY_API_URL.ADD_BRAND;
        const res = await api.post(url, params) as any
        if (res?.isSucceed)
            await getData();
        handleClose();
    };

    const getData = async () => {
        const res = await InventoryService.getBrands({}) as any;
        if (res?.isSucceed) {
            setBrands(res.data);
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
                            <TableCell>Ảnh</TableCell>
                            <TableCell>Thương hiệu</TableCell>
                            <TableCell>Danh mục</TableCell>
                            <TableCell></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {brands.map((_: any) => (
                            <TableRow key={_.id} sx={{ '& > *': { borderBottom: 'unset' } }}>
                                <TableCell>
                                    <Box className="flex">
                                        <Box className="mr-2 items-center justify-between h-[100px] w-[100px]">
                                            <img
                                                src={`${ENV.IMAGE_URL}/brand/${_.imagePath}`}
                                                alt={_.name}
                                                loading="lazy"
                                            />
                                        </Box>
                                    </Box>
                                </TableCell>
                                <TableCell>{_.name}</TableCell>
                                <TableCell>{_.categoryNames.join(', ')}</TableCell>
                                <TableCell>
                                    <IconButton
                                        size="small"
                                        onClick={() => viewDetail(_.id)}
                                    >
                                        <ModeEditIcon />
                                    </IconButton>
                                    <IconButton
                                        size="small"
                                        aria-haspopup="true"
                                        aria-controls={openDel ? 'basic-menu' : undefined}
                                        aria-expanded={openDel ? 'true' : undefined}
                                        onClick={() => deleteData(_.id)}
                                        //onClick={(event) => setDelAnchorEl(event.currentTarget)}
                                    >
                                        <DeleteOutlineIcon />
                                    </IconButton>
                                    <Menu
                                        anchorEl={delAnchorEl}
                                        open={openDel}
                                        onClose={() => setDelAnchorEl(null)}
                                        MenuListProps={{ 'aria-labelledby': 'basic-button' }}
                                    >
                                        <MenuItem onClick={() => deleteData(_.id)}>Xác nhận xóa</MenuItem>
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
                maxWidth={'xl'}
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
                            name="name"
                            label="Tên thương hiệu"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData.name || ''}
                            onChange={(e) => handleChange(e)}
                        />
                        <Autocomplete
                            multiple
                            id="checkboxes-tags-demo"
                            options={categories}
                            disableCloseOnSelect
                            getOptionLabel={(item: ICategory) => `${item.categoryId} - ${item.categoryName}`}
                            //getOptionDisabled={(option) => option.user !== null && option.user.id !== formData['id']}
                            value={categories.length > 0 && formData['categoryIds'] ? categories.filter((item) => formData['categoryIds'].includes(item.categoryId)) : []}
                            renderOption={(props, item, { selected }) => (
                                <li {...props}>
                                    <Checkbox
                                        icon={icon}
                                        checkedIcon={checkedIcon}
                                        style={{ marginRight: 8 }}
                                        checked={selected}
                                        size="small"
                                    />
                                    {item.categoryId} - {item.categoryName}
                                </li>
                            )}
                            renderInput={(params) => (
                                <TextField {...params} label="Danh mục" placeholder="Chọn danh mục" size="small" />
                            )}
                            onChange={(event, items) => onChangeCategories(items)}
                            size="small"
                        />
                        <FormControlLabel
                            control={
                                <Checkbox
                                    checked={JSON.stringify(formData['isHighlight']) === 'true'}
                                    onChange={onChangeIsHighlight}
                                    name="isHighlight"
                                    color="primary"
                                />}
                            label="Nổi bật"
                        />
                        <Grid item xs={12} sm={12}>
                            <UploadInput
                                id={`imageUser-upload`}
                                ref={uploadRef}
                                multiple
                                hidden
                                onChangeFiles={(event) => onChangeFiles(event)}
                                uploadType="brand"
                                filesLimit={1}
                                isRequired={true}
                                selectedFiles={[formData.imagePath]}
                            />
                        </Grid>
                        <Grid item xs={12} sm={12}>
                            <TextField
                                required
                                margin="dense"
                                name="descriptionTitle"
                                label="Tiêu đề"
                                type="text"
                                fullWidth
                                variant="standard"
                                sx={{ marginBottom: 2 }}
                                value={formData.descriptionTitle || ''}
                                onChange={(e) => handleChange(e)}
                            />
                        </Grid>
                        <Grid item xs={12} sm={12}>
                            <Editor
                                initialValue={formData['description'] ?? ''}
                                onInit={(evt, editor) => editorRef.current = editor}
                                apiKey={GlobalConfig.TINY_KEY}
                                init={{
                                    height: 500,
                                    plugins: GlobalConfig.TINY_PLUGINS,
                                    toolbar: GlobalConfig.TINY_TOOLBAR,
                                }}
                            />
                        </Grid>
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

export default BrandList;