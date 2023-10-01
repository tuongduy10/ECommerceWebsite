/* eslint-disable jsx-a11y/anchor-is-valid */
import { useState } from "react";
import MuiIcon from "../mui-icon/mui-icon.component";
import { ENV } from "src/_configs/enviroment.config";

interface IProductItemProps {
  grid: 3 | 4,
  data: any,
}

const ProductItem = (props: IProductItemProps) => {
  const [isFillHeart, setFillHeart] = useState(false);
  const product = props.data

  const toggleFill = () => {
    setFillHeart(!isFillHeart);
  };

  const getFormatedPrice = (price: number) => {
    return price ? price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }) : '';
  }

  return (
    <div className={`product product-${props.grid}`}>
      <div
        className="product-label lg:mt-1 flex justify-end items-center w-full bg-[#fff]"
        style={{ padding: "3px 0", position: "unset" }}
      >
        {product.discountPercent && <span className="label-sales">-{product.discountPercent}%</span>}
        {product.isNew && <span className="label-new">Mới</span>}
        {product.isHighlight && <span className="label-hot">Hot</span>}
        <a className="product-heart ">
          <MuiIcon
            name="HEART"
            onClick={toggleFill}
            className={`add-to-wishlist feather feather-heart cursor-pointer ${isFillHeart ? "fill" : ""
              }`}
          />
        </a>
      </div>
      <div className="product-img cursor-pointer sm:mt-6">
        <img src={`${ENV.IMAGE_URL}/products/${product.image}`} alt="" />
      </div>
      <hr
        style={{
          width: "50%",
          height: "1px",
          margin: "0 auto",
          backgroundColor: "#ddd",
        }}
      />
      <div className="product__info">
        <div className="product__info-detail text-center">
          <div className="product-brand align-items-center">{product.brandName}</div>
          <div className="product-name mb-0">{product.name}</div>

          <div className="product-name">
            Tạm hết đến 10/10/2010
          </div>
          {product.nameType && <div className="product-name">{product.nameType && `(${product.nameType})`}</div>}
          <div className="product-subprice" style={{ visibility: !product.priceOnSell ? 'hidden' : 'visible' }}>
            {getFormatedPrice(product.priceOnSell)}
          </div>
          <div className="product-price">{getFormatedPrice(product.price)}</div>
          <div className="product-btn">
            <a href="/">Xem nhanh</a>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductItem;
