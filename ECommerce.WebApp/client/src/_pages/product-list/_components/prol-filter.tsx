import { useState } from "react";
import { useDispatch } from "react-redux";
import { useLocation, useSearchParams } from "react-router-dom";
import { setParam } from "src/_cores/_reducers/product.reducer";
import { useProductStore } from "src/_cores/_store/root-store";
import MuiIcon from "src/_shares/_components/mui-icon/mui-icon.component";

const ProductListFilter = () => {
  const items = [
    { text: 'Tất cả', filterBy: '', orderBy: 'desc' },
    { text: 'Mẫu mới nhất', filterBy: 'newest', orderBy: 'desc' },
    { text: 'Giá thấp - cao', filterBy: 'price', orderBy: 'asc'},
    { text: 'Giá cao - thấp', filterBy: 'price', orderBy: 'desc' },
    { text: 'Đang giảm giá %', filterBy: 'discount', orderBy: 'desc' },
  ];

  const location = useLocation();
  const [selectedItem, setSelectedItem] = useState(items[0]);
  const [isOpenOrderList, setOpenOrderList] = useState(false);
  const [isOrderIconChanged, setOrderIconChanged] = useState(false);
  const [searchParams, setSearchParams] = useSearchParams();
  const updatedSearchParams = new URLSearchParams(searchParams.toString());

  const isHotSalePathName = location.pathname === '/hot-sale';
  const isNewPathName = location.pathname === '/new-products';
  const isFullGrid = isHotSalePathName || isNewPathName;

  const dispatch = useDispatch();
  const productStore = useProductStore();

  const mouseEnter = () => {
    setOpenOrderList(true);
    setOrderIconChanged(true);
  };

  const mouseLeave = () => {
    setOpenOrderList(false);
    setOrderIconChanged(false);
  };

  const toggleOrderList = () => {
    setOpenOrderList(!isOpenOrderList);
    setOrderIconChanged(!isOrderIconChanged);
  };

  const selectItem = (item: any) => {
    setSelectedItem(item);
    toggleOrderList();
    updatedSearchParams.set('filterBy', item.filterBy);
    updatedSearchParams.set('orderBy', item.orderBy);
    setSearchParams(updatedSearchParams);
    dispatch(setParam({
      ...productStore.param,
      filterBy: item.filterBy,
      orderBy: item.orderBy,
    }));
  }

  const uuidv4 = () => {
    return "10000000-1000-4000-8000-100000000000".replace(/[018]/g, c =>
      (+c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> +c / 4).toString(16)
    );
  }

  return (
    <div className="order__item-wrapper ">
      <div
        className="order__item-dropdown"
        onClick={toggleOrderList}
        onMouseEnter={mouseEnter}
        onMouseLeave={mouseLeave}
      >
        {selectedItem.text}
        <MuiIcon
          name="CHEVRON_DOWN"
          className={`feather feather-chevron-down svg-order ${isOrderIconChanged ? "svg-up" : ""
            }`}
        />
      </div>
      <div
        onMouseEnter={mouseEnter}
        onMouseLeave={mouseLeave}
        className={`order__item-dropdown_menu ${isOpenOrderList ? "open" : ""}`}
      >
        <div className="order__item-dropdown_items">
          {items.map(item => (
            <button key={uuidv4()} className="order__item text-left d-none" onClick={() => selectItem(item)}>
              {item.text}
              <MuiIcon
                name="CHEVRON_RIGHT"
                className="feather feather-chevron-right"
              />
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ProductListFilter;
