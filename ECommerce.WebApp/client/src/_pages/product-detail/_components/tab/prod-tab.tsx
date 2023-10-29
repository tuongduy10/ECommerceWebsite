/* eslint-disable jsx-a11y/anchor-has-content */
import { useEffect, useState } from "react";
import { MuiIcon } from "src/_shares/_components";
import ImageCommentDialog from "src/_pages/product-detail/_components/dialog/prod-img-comment";
import UserComment from "./user-comment";
import DetailInfo from "./detail-info";
import CustomIcon from "src/_shares/_components/mui-icon/_custom/mui-icon.custom";
import { useProductStore } from "src/_cores/_store/root-store";
import { IComment } from "src/_cores/_interfaces/product.interface";

/* eslint-disable jsx-a11y/anchor-is-valid */
const ProductDetailTab = () => {
  const productStore = useProductStore();
  const productDetail = productStore.productDetail;
  const [activeTab, setActiveTab] = useState(0);
  const [openDialog, setOpenDialog] = useState(false);

  const [comments, setComments] = useState<IComment[]>([]);

  const convertToNestedStructure = () => {
    const baseRates = productDetail?.review?.rates?.map((item: IComment) => {
      return { ...item, replies: [] }
    }) || [];
    const result: IComment[] = [];

    // Create a map to efficiently find rates by ID
    const rateMap = new Map<number, IComment>();
    baseRates.forEach((rate: IComment) => {
      rate['replies'] = [];
      rateMap.set(rate.id, rate);
    });

    // Build the nested structure
    baseRates.forEach((rate: any) => {
      const repliedId = rate.repliedId;
      if (repliedId !== null && rateMap.has(repliedId)) {
        rateMap.get(repliedId)?.replies.push(rate);
      } else {
        result.push(rate);
      }
    });
    setComments(result || []);
  }

  const handleClickCloseDialog = () => {
    setOpenDialog(false);
  };

  useEffect(() => {
    const tabs = document.querySelectorAll(".control-tab");
    tabs.forEach((tab, index) => {
      if (index === activeTab) {
        tab.classList.add("active");
      } else {
        tab.classList.remove("active");
      }
      convertToNestedStructure();
    });
  }, [activeTab]);

  return (
    <div className="product__detail-tab">
      <ImageCommentDialog
        openDialog={openDialog}
        handleClickCloseDialog={handleClickCloseDialog}
      />
      <div className="product__tab-control">
        <ul className="flex justify-around">
          <li className="mx-2">
            <a
              className={`control-tab detail-title ${activeTab === 0 ? "active" : ""
                }`}
              onClick={() => setActiveTab(0)}
            >
              Thông tin sản phẩm
            </a>
          </li>
          <li className="mx-2">
            <a
              className={`control-tab detail-title ${activeTab === 1 ? "active" : ""
                }`}
              onClick={() => setActiveTab(1)}
            >
              Đánh giá sản phẩm
            </a>
          </li>
        </ul>
      </div>
      <div className="product__tab-content">
        {activeTab === 0 && (
          <div className="content-tab tab__product-info active">
            <DetailInfo />
          </div>
        )}
        {activeTab === 1 && (
          <div className="content-tab tab__product-comment">
            <div className="product-comment">
              {/* NOT BE USER */}
              <div className="text-center mb-4 hidden">
                <button className="mx-auto">
                  <div className="flex items-center mb-[10px]">
                    <span className="relative h-[24px] mr-[10px]">
                      <MuiIcon className="feather feather-edit-3" name="EDIT" />
                      <CustomIcon />
                    </span>
                    <p className="h-[16px]">Viết bình luận</p>
                  </div>
                </button>
              </div>

              {/* USER  */}
              <div className="tab__content-block">
                <div className="flex">
                  <span className="input-title mx-auto">
                    VIẾT NHẬN XÉT CỦA BẠN BÊN DƯỚI
                  </span>
                </div>
                <UserComment id="post" type="post" />
              </div>
              {/* COMMENT */}
              <div className="tab__content-block block">
                <div className="user-comment mb-20">
                  {comments.map((comment: IComment) => <>
                    <UserComment key={`comment-${comment.id}`} id={`comment-${comment.id}`} type='comment' />
                    {comment.replies && comment.replies.length > 0 && (
                      <div className="listreply my-2">
                        {comment.replies.map((reply: IComment) => (
                          <UserComment key={`reply-${reply.id}`} id={`reply-${reply.id}`} type='reply' />
                        ))}
                      </div>
                    )}
                  </>)}
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default ProductDetailTab;
