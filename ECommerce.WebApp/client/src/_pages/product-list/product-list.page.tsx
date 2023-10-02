import ProductItem from "src/_shares/_components/product-item/product-item.component";
import { ProlCategory, ProlCategoryMb, ProlFilter, ProlPagination } from "./_components";
import { WebDirectional } from "src/_shares/_components";
import { useEffect } from "react";
import ProductService from "src/_cores/_services/product.service";
import { useProductStore } from "src/_cores/_store/root-store";
import { useDispatch } from "react-redux";
import { setParam, setProductList } from "src/_cores/_reducers/product.reducer";

const ProductListPage = () => {
  const productStore = useProductStore();
  const dispatch = useDispatch();


  useEffect(() => {
    const searchParams = new URLSearchParams(window.location.search);
    const _pageIndex = searchParams.get('pageIndex');
    const _brandId = searchParams.get('brandId');
    const _orderBy = searchParams.get('orderBy');

    const params = {
      pageIndex: Number(_pageIndex),
      brandId: Number(_brandId),
      orderBy: _orderBy ?? '',
    }
    getData(params);
  }, [productStore.param.pageIndex, productStore.param.orderBy]);

  const getData = (params: any) => {
    ProductService.getProductList(params).then((res: any) => {
      if (res.data) {
        const _data = res.data;
        const param = {
          ...productStore.param,
          pageIndex: _data.currentPage,
          totalPage: _data.totalPage,
          currentRecord: _data.currentRecord,
          totalRecord: _data.totalRecord,
        }
        dispatch(setParam(param));
        dispatch(setProductList(_data.items));
      }
    })
  }

  return (
    <div className="custom-container">
      <div className="content__wrapper products__content-wrapper">
        <div className="content__inner w-full">
          <WebDirectional items={[
            { name: 'Bear', path: '/brand/bear' }
          ]} />
          <div className="products__content flex justify-center">
            <div className="hidden md:block">
              <ProlCategory />
            </div>
            <div className="products__list ">
              <div className="filter__control-top">
                <ProlFilter />
                <ProlCategoryMb />
                <ProlPagination />
              </div>
              <div className="product__grid-wrapper">
                {productStore.productList.length > 0 ? (<>
                  <p className="product__grid-title text-center">Tất cả sản phẩm</p>
                  <div className="product__grid-inner w-full flex flex-wrap">
                    {productStore.productList.map((product) => (
                      <ProductItem key={product.id} grid={3} data={product} />
                    ))}
                  </div>
                </>) : (
                  <p className="text-center w-full">Chưa có sản phẩm</p>
                )}
              </div>
              <div className="filter__control-bottom">
                <ProlPagination />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductListPage;
