export interface IBrand {
  brandId: number;
  brandName: string;
  brandImagePath: string;
  status: boolean;
  createdDate: "2023-02-19T00:00:00";
  highlights: boolean;
  new: any;
  description: string;
  descriptionTitle: string;
  category: string;
  categoryIds: number[];
  shops: any
}

export interface ICategory {
  categoryId: number;
  categoryName: string;
}