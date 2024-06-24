import ProductItem from "src/_shares/_components/product-item/product-item.component";
import { ProlCategory, ProlCategoryMb, ProlFilter, ProlPagination } from "./_components";
import { WebDirectional } from "src/_shares/_components";
import { useEffect } from "react";
import ProductService from "src/_cores/_services/product.service";
import { useHomeStore, useProductStore } from "src/_cores/_store/root-store";
import { useDispatch } from "react-redux";
import { setParam, setProductList, setSubCategories } from "src/_cores/_reducers/product.reducer";
import InventoryService from "src/_cores/_services/inventory.service";
import { IOption, IOptionValue, ISubCategory } from "src/_cores/_interfaces/inventory.interface";
import { setSelectedBrand } from "src/_cores/_reducers/home.reducer";
import { useLocation, useSearchParams } from "react-router-dom";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";

const ProductListPage = () => {
  const location = useLocation();
  const searchParams = new URLSearchParams(window.location.search);
  const _pageIndex = Number(searchParams.get('pageIndex')) || 1;
  const _brandId = Number(searchParams.get('brandId')) || -1;
  const _orderBy = searchParams.get('orderBy') || "desc";
  const _filterBy = searchParams.get('filterBy') || "";
  const _subCategoryId = Number(searchParams.get('subCategoryId')) || -1;
  const _optionValueIds = searchParams.get('optionValueIds');

  const isHotSalePathName = location.pathname === ROUTE_NAME.HOT_SALE;
  const isNewPathName = location.pathname === ROUTE_NAME.NEW_PRODUCTS;
  const isAvailable = location.pathname === ROUTE_NAME.AVAILABLE_PRODUCTS;
  const isPreOrder = location.pathname === ROUTE_NAME.PREORDER_PRODUCTS;
  const isFullGrid = isHotSalePathName || isNewPathName || isAvailable || isPreOrder;

  const productStore = useProductStore();
  const homeStore = useHomeStore();
  const dispatch = useDispatch();

  useEffect(() => {
    const params = {
      pageIndex: _pageIndex,
      brandId: _brandId,
      orderBy: _orderBy,
      filterBy: _filterBy,
      isNew: isNewPathName || _filterBy === "newest",
      isHotSale: isHotSalePathName || _filterBy === "discount",
      isAvailable: isAvailable,
      isPreOrder: isPreOrder,
      subCategoryId: _subCategoryId,
      optionValueIds: _optionValueIds ? _optionValueIds.split(',').map(id => Number(id)) : [],
    }
    getData(params);
  }, [_pageIndex, _orderBy, _subCategoryId, _optionValueIds, location]);

  useEffect(() => {
    getSubCategories({ brandId: _brandId });
    checkAndGetBrands();
  }, [_brandId])

  const direactItem = () => {
    let name = homeStore.selectedBrand?.name ?? '';
    let path = `?pageIndex=${_pageIndex}&brandId=${homeStore.selectedBrand?.id}`;
    if (isHotSalePathName) {
      name = 'Hot sale';
      path = ROUTE_NAME.HOT_SALE
    }
    if (isNewPathName) {
      name = 'Sản phẩm mới';
      path = ROUTE_NAME.NEW_PRODUCTS;
    }
    if (isAvailable) {
      name = 'Hàng có sẵn';
      path = ROUTE_NAME.AVAILABLE_PRODUCTS;
    }
    if (isPreOrder) {
      name = 'Hàng đặt trước';
      path = ROUTE_NAME.PREORDER_PRODUCTS;
    }
    return {
      name: name,
      path: path
    }
  }

  const checkAndGetBrands = () => {
    if (!homeStore.selectedBrand) {
      async function getBrand() {
        const res = await InventoryService.getBrand(_brandId) as any;
        if (res.isSucceed) {
          dispatch(setSelectedBrand(res.data));
        }
      }
      if (_brandId > -1) {
        getBrand();
      }
    }
  }

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
    }).catch((error: any) => {
      console.log(error);
    });
  }

  const getSubCategories = (params: { brandId: number }) => {
    InventoryService.getSubCategories(params).then((res: any) => {
      if (res.data) {
        const list = res.data.map((item: ISubCategory) => {
          item.optionList?.forEach((option: IOption) => {
            option.values = option.values?.filter((value: IOptionValue) => (value.totalRecord ?? 0) > 0);
          });
          item.optionList = item.optionList?.filter((option: IOption) => (option.values?.length ?? 0) > 0);
          return item;
        });
        dispatch(setSubCategories(list));
      }
    }).catch(error => {
      console.log(error);
    });
  }

  return (
    <div className="custom-container">
      <div className="content__wrapper products__content-wrapper">
        <div className="content__inner w-full">
          <WebDirectional items={[
            direactItem()
          ]} />
          <div className="products__content flex justify-center">
            {!isFullGrid && (
              <div className="hidden md:block">
                <ProlCategory />
              </div>
            )}
            <div className={`products__list ${isFullGrid ? 'w-full' : ''}`}>
              <div className="filter__control-top">
                <ProlFilter />
                {!isFullGrid && (
                  <ProlCategoryMb />
                )}
                <ProlPagination />
              </div>
              <div className="product__grid-wrapper">
                {productStore.productList.length > 0 ? (<>
                  <p className="product__grid-title text-center">Tất cả sản phẩm</p>
                  <div className="product__grid-inner w-full flex flex-wrap">
                    {productStore.productList.map((product: any) => (
                      <ProductItem key={product.id} grid={isFullGrid ? 4 : 3} data={product} />
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
