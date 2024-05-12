export const ORDER_STATUS_CODE = {
    ORDER_PENDING: "ORDER_PENDING",
    ORDER_APPROVED: "ORDER_APPROVED",
    ORDER_REJECTED: "ORDER_REJECTED"
}
export const ORDER_STATUSES  = [
  { code: ORDER_STATUS_CODE.ORDER_PENDING, name: "Chờ xác nhận", backgroud: "#f0ad4e", color: "white" },
  { code: ORDER_STATUS_CODE.ORDER_APPROVED, name: "Đã xác nhận", backgroud: "#5cb85c", color: "white" },
  { code: ORDER_STATUS_CODE.ORDER_REJECTED, name: "Đã từ chối", backgroud: "#d9534f", color: "white" },
];
