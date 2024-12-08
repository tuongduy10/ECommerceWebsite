export interface IComment {
  id: number;
  value: number;
  comment: string;
  productId: number;
  createDate: any;
  repliedId: number | null;
  parentId: number | null;
  htmlPosition: string | null;
  userId: number;
  userRepliedId: number | null;
  idsToDelete: string;
  replies: any[];
  [key: string]: any;
}

export interface IProduct {
  id: number;
  code: string;
  ppc: string;
  name: string;
  description: string;
  size: string;
  delivery: string;
  repay: string;
  insurance: string;
  isLegit: boolean;
  stock: number;
  categoryName: string;
  subCategoryName: string;
  brand: {
    id: number;
    name: string;
    description: string;
    descriptionTitle: string;
    imagePath: string;
  };
  shop: {
    id: number;
    name: string;
  };
  options: {
    id: number;
    name: string;
    values: {
      id: number;
      name: string;
    }[];
  }[];
  attributes: {
    id: number;
    value: string;
    name: string;
  }[];
  createdDate: string;
  importDate: Date;
  // price
  discountPercent: number;
  priceAvailable: number;
  pricePreOrder: number;
  discountAvailable: number;
  discountPreOrder: number;
  priceImport: number;
  priceForSeller: number;
  profitAvailable: number;
  profitPreOrder: number;
  profitForSeller: number;
  profitPreOrderForSeller: number;
  profitAvailableForSeller: number;
  // images
  imagePaths: string[];
  userImagePaths: string[];
  // rating
  review: {
    avgValue: number;
    totalRating: number;
    rates: IComment[];
  };
  status: number;
  [key: string]: any;
}

export interface INewProductInCart {
  id: number;
  name: string;
  shopName: string;
  qty: number;
  image: string;
  options: { id: number; value: number, valueName: string }[];
  price: number;
  discount: number;
  priceType: 'AVAILABLE' | 'PREORDER';
}

export interface IProductInCart extends INewProductInCart {
  uniqId: string;
}
