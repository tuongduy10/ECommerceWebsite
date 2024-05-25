import { Box, Button, Checkbox, CircularProgress, Dialog, DialogActions, DialogContent, DialogTitle, FormControlLabel, IconButton, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from "@mui/material";
import { Editor } from "@tinymce/tinymce-react";
import { Fragment, useEffect, useRef, useState } from "react";
import { useDispatch } from "react-redux";
import { GlobalConfig } from "src/_configs/global.config";
import { showSuccess } from "src/_cores/_reducers/alert.reducer";
import CmsService from "src/_cores/_services/cms.service";
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import CheckIcon from '@mui/icons-material/Check';

const Blog = () => {
    const [checked, setChecked] = useState(false);
    const [openDialog, setOpenDialog] = useState(false);
    const [loading, setLoading] = useState(false);
    const [blogInfo, setBlogInfo] = useState<any>(null);
    const [config, setConfig] = useState<any>(null);
    const [blogs, setBlogs] = useState<any[]>([]);
    const editorRef = useRef<any>(null);
    const dispatch = useDispatch();

    useEffect(() => {
        getBlogs();
        getConfig();
    }, []);

    const getConfig = async () => {
        setLoading(true);
        const res = await CmsService.getConfig() as any;
        if (res?.isSucceed) {
            setConfig(res?.data);
            setLoading(false);
        }
    }

    const getBlogs = async () => {
        setLoading(true);
        const res = await CmsService.getBlogs() as any;
        if (res?.isSucceed) {
            setBlogs(res?.data);
            setLoading(false);
        }
    }


    const onOpenDialog = async (id: number) => {
        const res = await CmsService.getBlog(id) as any;
        if (res?.isSucceed) {
            setBlogInfo(res?.data);
            setChecked(res?.data?.status === 1);
            setOpenDialog(true);
        }
    }

    const handleCloseDialog = () => {
        setOpenDialog(false);
        setBlogInfo(null);
    };

    const handleChange = (e: any) => {
        const { name, value } = e.target;
        let _val = value;
        if (name === 'status') {
            if (value === 'on')
                _val = 1;
            if (value === 'off')
                _val = 0;
        }
        setBlogInfo({
            ...blogInfo,
            [name]: _val,
        });
    };

    const handleChangeConfig = (e: any) => {
        const { name, value } = e.target;
        setConfig({
            ...config,
            [name]: value,
        });
    };

    const handleSaveConfig = async () => {
        const res = await CmsService.saveConfig(config) as any;
        if (res?.isSucceed) {
            dispatch(showSuccess("Thành công"));
        }
    }

    const handleChecked = (e: any) => {
        setChecked(e.target.checked);
    }

    const handleSubmit = async (e: any) => {
        e.preventDefault();
        const param = {
            ...blogInfo,
            status: checked === true ? 1 : 0,
            blogContent: editorRef.current.getContent()
        }
        const res = await CmsService.saveBlog(param) as any;
        if (res?.isSucceed) {
            dispatch(showSuccess("Thành công"));
            handleCloseDialog();
            await getBlogs();
        }
    }

    return (
        <Fragment>
            <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
                <Table aria-label="collapsible table">
                    <TableBody>
                        <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
                            <TableCell>
                                <TextField
                                    autoFocus
                                    required
                                    margin="dense"
                                    name="phoneNumber"
                                    label="Số điện thoại"
                                    type="text"
                                    fullWidth
                                    variant="standard"
                                    sx={{ marginBottom: 2 }}
                                    value={config?.phoneNumber || ''}
                                    onChange={handleChangeConfig}
                                />
                            </TableCell>
                            <TableCell>
                                <TextField
                                    autoFocus
                                    required
                                    margin="dense"
                                    name="mail"
                                    label="Email"
                                    type="text"
                                    fullWidth
                                    variant="standard"
                                    sx={{ marginBottom: 2 }}
                                    value={config?.mail || ''}
                                    onChange={handleChangeConfig}
                                />
                            </TableCell>
                            <TableCell>
                                <TextField
                                    autoFocus
                                    required
                                    margin="dense"
                                    name="facebookUrl"
                                    label="facebook"
                                    type="text"
                                    fullWidth
                                    variant="standard"
                                    sx={{ marginBottom: 2 }}
                                    value={config?.facebookUrl || ''}
                                    onChange={handleChangeConfig}
                                />
                            </TableCell>
                            <TableCell>
                                <TextField
                                    autoFocus
                                    required
                                    margin="dense"
                                    name="address"
                                    label="Địa chỉ"
                                    type="text"
                                    fullWidth
                                    variant="standard"
                                    sx={{ marginBottom: 2 }}
                                    value={config?.address || ''}
                                    onChange={handleChangeConfig}
                                />
                            </TableCell>
                            <TableCell>
                                <TextField
                                    autoFocus
                                    required
                                    margin="dense"
                                    name="addressUrl"
                                    label="Google address url"
                                    type="text"
                                    fullWidth
                                    variant="standard"
                                    sx={{ marginBottom: 2 }}
                                    value={config?.addressUrl || ''}
                                    onChange={handleChangeConfig}
                                />
                            </TableCell>
                            <TableCell>
                                <IconButton
                                    size="small"
                                    onClick={() => handleSaveConfig()}
                                >
                                    <CheckIcon />
                                </IconButton>
                            </TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
                <Table aria-label="collapsible table">
                    <TableHead>
                        <TableRow>
                            <TableCell>Cột</TableCell>
                            <TableCell>Tiêu đề</TableCell>
                            <TableCell>Trạng thái</TableCell>
                            <TableCell></TableCell>
                        </TableRow>
                    </TableHead>
                    {loading
                        ? <CircularProgress />
                        : <TableBody>
                            {blogs.length > 0 && blogs.map((item, idx) => (
                                <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
                                    <TableCell>{item.blogPosition}</TableCell>
                                    <TableCell>{item.blogTitle}</TableCell>
                                    <TableCell>{item.status === 1 ? 'Đang hoạt động' : 'Tạm ẩn'}</TableCell>
                                    <TableCell>
                                        <IconButton
                                            size="small"
                                            onClick={() => onOpenDialog(item.blogId)}
                                        >
                                            <ModeEditIcon />
                                        </IconButton>
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>}
                </Table>
            </TableContainer>

            <Dialog
                fullScreen
                open={openDialog}
                onClose={handleCloseDialog}
            >
                <Box component={'form'} onSubmit={handleSubmit}>
                    <DialogContent>
                        <TextField
                            autoFocus
                            required
                            margin="dense"
                            name="blogTitle"
                            label="Tiêu đề"
                            type="text"
                            fullWidth
                            variant="standard"
                            sx={{ marginBottom: 2 }}
                            value={blogInfo?.blogTitle || ''}
                            onChange={handleChange}
                        />
                        <Editor
                            initialValue={blogInfo ? blogInfo.blogContent : ''}
                            onInit={(evt, editor) => editorRef.current = editor}
                            apiKey={GlobalConfig.TINY_KEY}
                            init={{
                                height: '70vh',
                                plugins: GlobalConfig.TINY_PLUGINS,
                                toolbar: GlobalConfig.TINY_TOOLBAR,
                            }}
                        />
                        <FormControlLabel control={<Checkbox name="status" checked={checked} onChange={handleChecked} />} label="Đang hoạt động" />
                    </DialogContent>
                    <DialogActions>
                        <Button onClick={handleCloseDialog}>Đóng</Button>
                        <Button type="submit">Xác nhận</Button>
                    </DialogActions>
                </Box>
            </Dialog>
        </Fragment>
    );
};

export default Blog;
