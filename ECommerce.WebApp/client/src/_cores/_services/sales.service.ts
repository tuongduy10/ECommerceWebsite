import { api } from "../_api/api";
import { SALES_API_URL } from "../_enums/api-url.enum";

export default class SalesService {
    public static getPaymentMethods() {
        return api.get(SALES_API_URL.PAYMENT_METHODS);
    }
    public static savePaymentMethod(params: any) {
        return api.post(SALES_API_URL.SAVE_PAYMENT_METHODS, params);
    }
    public static deletePaymentMethod(id: number) {
        return api.post(SALES_API_URL.DELETE_PAYMENT_METHODS, id);
    }
}