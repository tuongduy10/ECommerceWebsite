import { api } from "../_api/api";
import { IPagedRequest } from "../_interfaces";

export default class OmsService {
  public static createOrder(param: any) {
    return api.post("/order/create-order", param);
  }
  public static getPendingOrders() {
    return api.get("/order/pending-orders");
  }
  public static getOrdersPaging(param: IPagedRequest) {
    return api.post("/order/orders-paging", param);
  }
}
