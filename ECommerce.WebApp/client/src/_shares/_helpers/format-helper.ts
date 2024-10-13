import { ORDER_STATUSES } from "src/_cores/_constants/order-constants";

export class FormatHelper {
  public static getNumber(inputString?: string): number {
    if (inputString) {
      // Remove non-numeric characters (everything except digits and a decimal point)
      const cleanedString = inputString.replace(/[^0-9.]/g, "");
      // Convert the cleaned string to a number
      const number = parseFloat(cleanedString);
      return number || 0;
    }
    return 0;
  }
  public static getOrderStatus(status: string) {
    const idx = ORDER_STATUSES.findIndex(_ => _.code === status);
    if (idx > -1)
      return ORDER_STATUSES[idx]
    return null;
  }
  public static getPaymentMethod(method: string) {
    switch (method) {
      case 'cash': return "Tiền mặt";
      case 'bank': return "Chuyển khoản";
      default: return method
    }
  }
}
