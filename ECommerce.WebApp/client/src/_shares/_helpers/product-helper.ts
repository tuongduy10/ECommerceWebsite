export class ProductHelper {
  public static getProductListFormated(productList: any) {
    const formattedList = [];

    for (const item of productList) {
      const pro = {
        id: item.id,
        name: item.name,
        image: item.imagePaths && item.imagePaths.length > 0 ? item.imagePaths[0] : "",
        discountPercent: item.discountPercent,
        isNew: item.isNew,
        isHighlight: item.isHighlight,
        shopName: item.shopName,
        brandName: item.brandName,
        productImportDate: item.ProductImportDate,
        price: item.pricePreOrder ?? item.priceAvailable,
        priceOnSell: item.discountPreOrder ?? item.discountAvailable,
        nameType:
          (item.pricePreOrder != null || item.discountAvailable != null)
            ? "Hàng đặt trước"
            : (item.pricePreOrder != null || item.discountAvailable != null)
                ? "Hàng có sẵn"
                : "",
      };

      formattedList.push(pro);
    }

    return formattedList;
  }
}
