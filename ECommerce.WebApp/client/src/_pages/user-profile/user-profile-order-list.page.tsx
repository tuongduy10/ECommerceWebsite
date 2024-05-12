import { Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from "@mui/material";
import { useEffect, useState } from "react";
import { IOrderPagedRequest } from "../admin/interfaces/oms-interface";
import OmsService from "src/_cores/_services/oms.service";
import { DateTimeHelper } from "src/_shares/_helpers/datetime-helper";
import { StatusDisplay } from "src/_shares/_components";
import { ProductHelper } from "src/_shares/_helpers/product-helper";

const UserProfileOrderList = () => {
    const [orders, setOrders] = useState<any[]>([]);
    const [totalPages, setTotalPages] = useState<number>(1);
    const [params, setParams] = useState<IOrderPagedRequest>({
        pageIndex: 1,
        pageSize: 10,
        searchKey: '',
        status: ''
    });

    useEffect(() => {
        search(params);
    }, []);

    const getFormatedPrice = (price: number) => ProductHelper.getFormatedPrice(price);

    const search = async (_params: IOrderPagedRequest) => {
        const response = await OmsService.getUserOrdersPaging(_params) as any;
        if (response?.isSucceed) {
            setOrders(response.data?.items);
            setTotalPages(response.data?.totalPages);
        }
    }

    return (
        <div className="tab-content">
            <div className="text-center">
                <div className="title"><strong>LỊCH SỬ ĐƠN HÀNG</strong></div>
            </div>
            <div className="mx-auto">
                <TableContainer component={Paper} sx={{ marginBottom: 2 }}>
                    <Table size="small">
                        <TableHead>
                            <TableRow>
                                <TableCell sx={{ fontWeight: 'bold' }}>Ngày tạo</TableCell>
                                <TableCell sx={{ fontWeight: 'bold' }}>Mã đơn hàng</TableCell>
                                <TableCell sx={{ fontWeight: 'bold' }}>Tạm tính</TableCell>
                                <TableCell sx={{ fontWeight: 'bold' }}>Thành tiền</TableCell>
                                <TableCell sx={{ fontWeight: 'bold' }}>Trạng thái</TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                            {orders.length > 0 && orders.map((item, idx) => (
                                <TableRow sx={{ '& > *': { borderBottom: 'unset' } }}>
                                    <TableCell>{DateTimeHelper.getDateTimeFormated(item.createdDate)}</TableCell>
                                    <TableCell>#{item.orderCode}</TableCell>
                                    <TableCell>{getFormatedPrice(item.totalPrice)}</TableCell>
                                    <TableCell>{getFormatedPrice(item.totalFinalPrice)}</TableCell>
                                    <TableCell>
                                        <StatusDisplay className="text-base" statusCode={item.status} />
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </TableContainer>
            </div>
        </div>
    )
}

export default UserProfileOrderList;