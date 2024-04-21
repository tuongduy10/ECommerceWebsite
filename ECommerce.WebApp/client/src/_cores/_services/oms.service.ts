import { api } from "../_api/api";

export default class OmsService {
  public static createOrder(param: any) {
    return api.post("/order/create-order", param);
  }
  public static getPendingOrders() {
    return api.get("/order/pending-orders");
  }
}
