import { ENV } from "src/_configs/enviroment.config";

export class ProductHelper {
  public static getProductListFormated(productList: any) {
    const formattedList = [];

    for (const item of productList) {
      const price = Number(item.pricePreOrder) || Number(item.priceAvailable);
      const priceOnSell = Number(item.discountPreOrder) || Number(item.discountAvailable);
      const discountPercent = priceOnSell
        ? Math.round(((price - priceOnSell) * 100) / price)
        : item.discountPercent;

      const pro = {
        id: item.id,
        name: item.name,
        image:
          item.imagePaths && item.imagePaths.length > 0
            ? item.imagePaths[0]
            : "",
        discountPercent: discountPercent,
        isNew: item.isNew,
        isHighlight: item.isHighlight,
        shopName: item.shopName,
        brandName: item.brandName,
        importDate: item.importDate,
        price: price,
        priceOnSell: priceOnSell,
        nameType:
          item.pricePreOrder != null || item.discountPreOrder != null ? "Hàng đặt trước" : 
          item.priceAvailable != null || item.discountAvailable != null ? "Hàng có sẵn" : "",
      };

      formattedList.push(pro);
    }

    return formattedList;
  }
  public static getFormatedPrice(price: number) {
    return price
      ? price.toLocaleString("vi-VN", { style: "currency", currency: "VND" })
      : "";
  }
  public static getProductStatus(_status: number) {
    switch (_status) {
      case 0:
        return { label: "Đã ẩn", color: "" };
      case 1:
        return { label: "Đang bán", color: "#1cc88a" };
      default:
        return { label: "", color: "" };
    }
  }
  public static getImagePath(type: 'product' | 'brand' | 'rates', name: string) {
    return `${ENV.IMAGE_URL}/${type}/${name}`;
  }
}
