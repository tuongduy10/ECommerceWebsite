import { IOrderPagedRequest } from "src/_pages/admin/interfaces/oms-interface";
import { api } from "../_api/api";
import { IPagedRequest } from "../_interfaces";

export default class OmsService {
  public static createOrder(param: any) {
    return api.post("/order/create-order", param);
  }
  public static getPendingOrders() {
    return api.get("/order/pending-orders");
  }
  public static getOrdersPaging(param: IOrderPagedRequest) {
    return api.post("/order/orders-paging", param);
  }
  public static getUserOrdersPaging(param: IOrderPagedRequest) {
    return api.post("/order/user-orders-paging", param);
  }
}
