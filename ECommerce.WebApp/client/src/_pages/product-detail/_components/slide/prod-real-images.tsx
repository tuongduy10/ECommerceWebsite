import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/free-mode";
import "swiper/css/pagination";
import { Autoplay, FreeMode, Pagination } from "swiper";
import { useProductStore } from "src/_cores/_store/root-store";
import { ENV } from "src/_configs/enviroment.config";

const ProductDetailRealImages = () => {
  const productStore = useProductStore();

  return (
    <div className="product__images-slider">
      <h1 className="detail-title mb-0">
        <strong>HÌNH ẢNH THỰC TẾ</strong>
      </h1>
      <hr className="mt-0" />
      <Swiper
        slidesPerView={4}
        spaceBetween={30}
        freeMode={true}
        pagination={{
          clickable: true,
        }}
        autoplay={{
          delay: 1500,
          disableOnInteraction: false,
        }}
        modules={[Autoplay, FreeMode, Pagination]}
        className="mySwiper cursor-grab"
      >
        {productStore.productDetail?.userImagePaths.map((_) => (
          <SwiperSlide key={_}>
            <img
              src={ENV.IMAGE_URL + '/products/' + _}
              alt=""
            />
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default ProductDetailRealImages;
