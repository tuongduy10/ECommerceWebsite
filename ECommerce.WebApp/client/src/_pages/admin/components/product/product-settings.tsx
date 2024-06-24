import { ThemeProvider } from "@emotion/react"
import { Box, Button, CssBaseline, Grid, TextField, Typography, createTheme } from "@mui/material";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { Form, useNavigate } from "react-router-dom";
import { ADMIN_ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { showSuccess } from "src/_cores/_reducers/alert.reducer";
import ProductService from "src/_cores/_services/product.service";
import { FormatHelper } from "src/_shares/_helpers/format-helper";
const defaultTheme = createTheme();

interface IDataDetail {
    [key: string]: any
}
const ProductSettings = () => {
    const navigate = useNavigate();
    const [dataDetail, setDataDetail] = useState<any>({});
    const dispatch = useDispatch();

    useEffect(() => {
        getSettings();
    }, []);

    const getSettings = async () => {
        const res = await ProductService.getSettings() as any;
        if (res?.isSucceed) {
            setDataDetail(res.data);
        }
    }

    const handleKeyPress = (event: React.KeyboardEvent<HTMLFormElement>) => {
        if (event.key === 'Enter') {
            event.preventDefault();
        }
    };

    const backToList = () => {
        navigate({
            pathname: ADMIN_ROUTE_NAME.MANAGE_PRODUCT
        });
    }

    const onChangeFieldValue = (field: string, value: any) => {
        setDataDetail({ ...dataDetail, [field]: value });
    }

    const getNumber = (value: any) => FormatHelper.getNumber(value);

    const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        const form = new FormData(event.currentTarget);
        const param = {
            id: dataDetail['id'],
            newPeriod: getNumber(form.get('newPeriod')),
        }
        const res = await ProductService.updateSettings(param) as any;
        if (res?.isSucceed) {
            dispatch(showSuccess("Cập nhật thành công"));
        }
    }

    return (
        <ThemeProvider theme={defaultTheme}>
            <Typography component="h1" variant="h5" sx={{ mb: 3 }}>
                Cài đặt
            </Typography>
            <Form noValidate onSubmit={handleSubmit} onKeyPress={handleKeyPress}>
                <Grid container spacing={2}>
                    <Grid item xs={7}>
                        <CssBaseline />
                        <Box
                            sx={{
                                display: 'flex',
                                flexDirection: 'column',
                            }}
                        >
                            <Grid container spacing={2}>
                                <Grid item xs={12} sm={5}>
                                    <TextField
                                        value={dataDetail['newPeriod']}
                                        onChange={(event) => onChangeFieldValue('newPeriod', event?.target?.value)}
                                        InputLabelProps={{ shrink: true }}
                                        type="number"
                                        name="newPeriod"
                                        label="Thời gian sản phẩm mới (ngày)"
                                        size="small"
                                        fullWidth
                                    />
                                </Grid>
                            </Grid>
                        </Box>
                    </Grid>
                    <Grid item xs={12} sm={12}>
                        <Button sx={{ marginRight: 2 }} variant="outlined" onClick={backToList}>
                            Quay lại
                        </Button>
                        <Button type="submit" variant="contained">
                            Cập nhật
                        </Button>
                    </Grid>
                </Grid>
            </Form>
        </ThemeProvider>
    )
}

export default ProductSettings;