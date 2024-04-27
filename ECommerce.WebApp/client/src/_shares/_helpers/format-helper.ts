export class FormatHelper {
  public static getNumber(inputString?: string) {
    if (inputString) {
      // Remove non-numeric characters (everything except digits and a decimal point)
      const cleanedString = inputString.replace(/[^0-9.]/g, "");
      // Convert the cleaned string to a number
      const number = parseFloat(cleanedString);
      return number;
    }
    return null;
  }
  public static getOrderStatus(status: string) {
    switch (status) {
      case 'ORDER_PENDING': return "Chờ duyệt";
      default: return status
    }
  }
  public static getPaymentMethod(method: string) {
    switch (method) {
      case 'cash': return "Tiền mặt";
      case 'bank': return "Chuyển khoản";
      default: return method
    }
  }
}
