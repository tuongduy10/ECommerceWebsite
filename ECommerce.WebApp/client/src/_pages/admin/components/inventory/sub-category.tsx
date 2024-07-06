import { Autocomplete, Box, Button, Checkbox, Collapse, Dialog, DialogActions, DialogContent, DialogTitle, Grid, IconButton, ListItemText, Menu, MenuItem, OutlinedInput, Paper, Popper, Select, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField, Typography } from "@mui/material";
import { FormEvent, Fragment, useEffect, useRef, useState } from "react";
import { ICategory, ISubCategory } from "src/_cores/_interfaces/inventory.interface";
import { ITableHeader } from "src/_shares/_components/data-table/data-table";
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@mui/icons-material/KeyboardArrowUp';
import CheckBoxOutlineBlankIcon from '@mui/icons-material/CheckBoxOutlineBlank';
import CheckBoxIcon from '@mui/icons-material/CheckBox';
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import InventoryService from "src/_cores/_services/inventory.service";
import { Editor } from "@tinymce/tinymce-react";
import { GlobalConfig } from "src/_configs/global.config";
import { useDispatch } from "react-redux";
import { showSuccess } from "src/_cores/_reducers/alert.reducer";

const icon = <CheckBoxOutlineBlankIcon fontSize="small" />;
const checkedIcon = <CheckBoxIcon fontSize="small" />;

const header: ITableHeader[] = [
    { field: 'name', fieldName: 'Tên loại sản phẩm', align: 'left' },
    { field: 'category', fieldName: 'Danh mục', align: 'left' },
    { field: 'sizeGuide', fieldName: 'Hướng dẫn chọn size', align: 'left' },
    { field: 'action', fieldName: '', align: 'center' }
];

type TableRowProps = {
    rowData: ISubCategory,
    isSelected: boolean,
    onUpdateStatus: (id: number, status: number) => void,
    onDelete: (id: number) => void,
    onSelected: (id: number) => void,
    onViewDetail: (id: number) => void,
    onOpenSizeGuide: (sizeGuide: any, subId: number) => void,
}

function Row(props: TableRowProps) {
    const { rowData, isSelected, onUpdateStatus, onDelete, onSelected, onViewDetail, onOpenSizeGuide } = props;
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const [open, setOpen] = useState(false);
    const openDel = Boolean(delAnchorEl);

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

    const openSizeGuide = (sizeGuide: any, subId: number) => {
        onOpenSizeGuide(sizeGuide, subId);
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
                        sx={{ display: 'none' }}
                    >
                        {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
                    </IconButton>
                    <IconButton
                        size="small"
                        onClick={() => viewDetail(rowData.id)}
                    >
                        <ModeEditIcon />
                    </IconButton>
                </TableCell>
                <TableCell align="left">{rowData.name}</TableCell>
                <TableCell align="left">{rowData.category?.categoryName ?? ''}</TableCell>
                <TableCell align="left">
                    <Button
                        size="small"
                        onClick={() => openSizeGuide(rowData.sizeGuide, rowData.id)}
                    >
                        {rowData.sizeGuide === null ? 'Tạo' : 'Xem'}
                    </Button>
                </TableCell>
                <TableCell align="center">
                    <Button
                        variant="outlined"
                        color="error"
                        aria-controls={openDel ? 'basic-menu' : undefined}
                        aria-haspopup="true"
                        aria-expanded={openDel ? 'true' : undefined}
                        onClick={handleClickDel}
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

                    </Collapse>
                </TableCell>
            </TableRow>
        </Fragment>
    );
}

export default function SubCategory() {
    const [open, setOpen] = useState(false);
    const [openSizeGuide, setOpenSizeGuide] = useState(false);

    const [subCategories, setSubCategories] = useState<any[]>([]);
    const [categories, setCategories] = useState<ICategory[]>([]);
    const [attributes, setAttributes] = useState<any[]>([]);
    const [options, setOptions] = useState<any[]>([]);
    const [selectedSubCategories, setSelectedSubCategories] = useState<number[]>([]);

    const sizeGuideRef = useRef<any>(null);
    const [sizeGuide, setSizeGuide] = useState<any>(undefined);
    const [sizeGuideSubId, setSizeGuideSubId] = useState(-1);
    const dispatch = useDispatch();
    
    const [formData, setFormData] = useState({
        id: -1,
        name: '',
        categoryId: -1,
        attributeIds: [] as any,
        optionIds: [] as any,
        sizeGuideId: -1
    });

    useEffect(() => {
        search();
    }, []);

    const isIndeterminate = (): boolean => selectedSubCategories.length > 0 && selectedSubCategories.length < subCategories.length;
    const isSelectedAll = (): boolean => selectedSubCategories.length > 0 && selectedSubCategories.length === subCategories.length;

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

    const handleClose = () => {
        setOpen(false);
        setFormData({
            ...formData,
            id: -1,
            name: '',
            categoryId: -1,
            attributeIds: [],
            optionIds: []
        });
    };

    const handleCloseSizeGuide = () => {
        setOpenSizeGuide(false);
        setSizeGuide(undefined);
        setSizeGuideSubId(-1);
    };

    const search = async (_params?: any) => {
        const subResponse = await InventoryService.getSubCategories() as any;
        if (subResponse?.isSucceed) {
            setSubCategories(subResponse.data);
        }
        const response = await InventoryService.getCategories() as any;
        if (response?.isSucceed) {
            setCategories(response.data);
        }

        const attrRes = await InventoryService.getAttributes() as any;
        if (attrRes?.isSucceed) {
            setAttributes(attrRes.data);
        }

        const optRes = await InventoryService.getOptions() as any;
        if (optRes?.isSucceed) {
            setOptions(optRes.data);
        }
        setSelectedSubCategories([]);
    }

    const onSearch = (event: FormEvent<HTMLFormElement>) => {
        event.preventDefault();
    }

    const selectAll = () => {
        if (isIndeterminate() || isSelectedAll()) {
            setSelectedSubCategories([]);
            return;
        }
        const ids = [...subCategories].map(_ => _.id);
        setSelectedSubCategories(ids);
    }

    const updateStatus = (id: number, status: number) => {
        const _params = {
            ids: selectedSubCategories.length > 0 ? selectedSubCategories : [id],
            status: status,
        }
    }

    const deleteSubCategory = async (id: number) => {
        const response = await InventoryService.deleteSubCategory(id) as any;
        if (response?.isSucceed) { 
            dispatch(showSuccess("Xóa thành công"));
            await search();
        }
    }

    const selectSubCategory = (id: number) => {
        if (!selectedSubCategories.includes(id)) {
            const addNewSelected = selectedSubCategories.concat(id);
            setSelectedSubCategories(addNewSelected);
        } else {
            const removeSelected = selectedSubCategories.filter(_ => _ !== id);
            setSelectedSubCategories(removeSelected);
        }
    }

    const viewDetail = async (id: number) => {
        const response = await InventoryService.getSubCategories({ subCategoryId: id }) as any;
        if (response?.isSucceed) {
            const _data = response?.data[0];
            const _value = {
                ...formData,
                id: _data.id,
                name: _data.name,
                categoryId: _data.category?.categoryId ?? -1,
                attributeIds: _data.attributes.map((_: any) => _.id),
                optionIds: _data.optionList.map((_: any) => _.id)
            }
            setFormData(_value);
            if (response.data)
                handleClickOpen();
        }
    }

    const onOpenSizeGuide = (sizeGuide: any, subId: number) => {
        if (sizeGuide != null) {
            setSizeGuide(sizeGuide);
        }
        setOpenSizeGuide(true);
        setSizeGuideSubId(subId);
    }

    const onChangeCategory = (value: ICategory) => {
        setFormData({
            ...formData,
            categoryId: value?.categoryId ?? -1
        });
    }

    const onChangeAttributes = (values: any) => {
        setFormData({
            ...formData,
            attributeIds: values.map((_: any) => _.id) ?? []
        });
    }

    const onChangeOptions = (values: any) => {
        setFormData({
            ...formData,
            optionIds: values.map((_: any) => _.id) ?? []
        });
    }

    const handleSubmit = async (e: any) => {
        e.preventDefault();
        const returnToList = async () => {
            await search();
            handleClose();
        }
        const _params = {
            ...formData,
            attributes: formData.attributeIds.map((_: any) => ({ id: _ })),
            optionList: formData.optionIds.map((_: any) => ({ id: _ })),
        }
        if (formData.id > -1) {
            const reqUpdate = await InventoryService.updateSubCategory(_params) as any;
            if (reqUpdate?.isSucceed) {
                await returnToList();
            }
        } else {
            const reqAdd = await InventoryService.addSubCategory(_params) as any;
            if (reqAdd?.isSucceed) {
                await returnToList();
            }
        }
    };

    const handleSubmitSizeGuide = async (e: any) => {
        e.preventDefault();
        const params = {
            ...sizeGuide,
            content: sizeGuideRef.current.getContent(),
            subCategoryId: sizeGuideSubId
        }
        console.log(params);
        const res = await InventoryService.saveSizeGuide(params) as any;
        if (res?.isSucceed) {
            handleCloseSizeGuide();
            search();
        }
    }

    return (
        <Fragment>
            <Box>
                <Grid container spacing={2} sx={{ marginBottom: 2 }}>
                    <Grid item xs={12} sm={4}>
                        <Button variant="contained" sx={{ marginRight: 2 }} onClick={handleClickOpen}>Thêm</Button>
                    </Grid>
                </Grid>
            </Box>
            <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
                <Table aria-label="collapsible table">
                    <TableHead>
                        <TableRow>
                            <TableCell>
                                <Checkbox
                                    indeterminate={isIndeterminate()}
                                    checked={isSelectedAll()}
                                    onChange={selectAll}
                                    sx={{ display: 'none' }}
                                />
                            </TableCell>
                            {header.map((field) => (
                                <TableCell key={field.field} align={!field.align ? 'left' : field.align}>{field.fieldName}</TableCell>
                            ))}
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {subCategories.length > 0 && subCategories.map((item, idx) => (
                            <Row
                                key={`row-${item.id}`}
                                rowData={item}
                                isSelected={selectedSubCategories.includes(item.id)}
                                onUpdateStatus={(id, status) => updateStatus(id, status)}
                                onDelete={(id) => deleteSubCategory(id)}
                                onSelected={(id) => selectSubCategory(id)}
                                onViewDetail={(id) => viewDetail(id)}
                                onOpenSizeGuide={(sizeGuide: any, subId: number) => onOpenSizeGuide(sizeGuide, subId)}
                            />
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
                    <DialogTitle>Loại sản phẩm</DialogTitle>
                    <DialogContent>
                        <TextField
                            autoFocus
                            required
                            margin="dense"
                            name="name"
                            label="Tên loại sản phẩm"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={formData.name || ''}
                            onChange={handleChange}
                        />
                        <Autocomplete
                            size="small"
                            disablePortal
                            sx={{ marginBottom: 2 }}
                            options={categories}
                            value={categories.find(_ => _.categoryId === formData.categoryId) ?? null}
                            onChange={(event, value) => value && onChangeCategory(value)}
                            getOptionLabel={(option) => `${option.categoryName}`}
                            renderOption={(props, option) => <li {...props}>{option.categoryName}</li>}
                            renderInput={(params) => <TextField {...params} label="Danh mục" />}
                        />
                        <Autocomplete
                            multiple
                            size="small"
                            disablePortal
                            options={attributes}
                            sx={{ marginBottom: 2 }}
                            getOptionLabel={(_) => _.name}
                            value={attributes.length > 0 ? attributes.filter((_: any) => formData.attributeIds.includes(_.id)) : []}
                            renderInput={(params) => <TextField {...params} name="attribute" label="Thông tin chi tiết" />}
                            renderOption={(props, _, { selected }) => (
                                <li {...props}>
                                    <Checkbox
                                        icon={icon}
                                        checkedIcon={checkedIcon}
                                        style={{ marginRight: 8 }}
                                        checked={selected}
                                        size="small"
                                    />
                                    {_.name}
                                </li>
                            )}
                            onChange={(event, values) => onChangeAttributes(values)}
                        />
                        <Autocomplete
                            multiple
                            size="small"
                            disablePortal
                            options={options}
                            sx={{ marginBottom: 2 }}
                            getOptionLabel={(_) => _.name}
                            value={options.length > 0 ? options.filter((_: any) => formData.optionIds.includes(_.id)) : []}
                            renderInput={(params) => <TextField {...params} name="option" label="Thông tin tùy chọn" />}
                            renderOption={(props, _, { selected }) => (
                                <li {...props}>
                                    <Checkbox
                                        icon={icon}
                                        checkedIcon={checkedIcon}
                                        style={{ marginRight: 8 }}
                                        checked={selected}
                                        size="small"
                                    />
                                    {_.name} ({_.values.filter((_: any) => _.isBase).map((_: any) => _.name).join(", ")})
                                </li>
                            )}
                            onChange={(event, values) => onChangeOptions(values)}
                        />
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={handleClose}>Đóng</Button>
                        <Button type="submit">Xác nhận</Button>
                    </DialogActions>
                </Box>
            </Dialog>

            <Dialog
                fullScreen
                open={openSizeGuide}
                onClose={handleCloseSizeGuide}
            >
                <Box component={'form'} onSubmit={handleSubmitSizeGuide}>
                    <DialogTitle>Hướng dẫn chọn size</DialogTitle>
                    <DialogContent>
                        <Editor
                            initialValue={sizeGuide ? sizeGuide.content : ''}
                            onInit={(evt, editor) => sizeGuideRef.current = editor}
                            apiKey={GlobalConfig.TINY_KEY}
                            init={{
                                height: 500,
                                plugins: GlobalConfig.TINY_PLUGINS,
                                toolbar: GlobalConfig.TINY_TOOLBAR,
                            }}
                        />
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={handleCloseSizeGuide}>Đóng</Button>
                        <Button type="submit">Xác nhận</Button>
                    </DialogActions>
                </Box>
            </Dialog>
        </Fragment>
    );
}
