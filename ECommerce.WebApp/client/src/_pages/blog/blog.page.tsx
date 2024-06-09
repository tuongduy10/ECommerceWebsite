import { useEffect, useState } from "react";
import CmsService from "src/_cores/_services/cms.service";
import CommonService from "src/_cores/_services/common.service";
import { WebDirectional } from "src/_shares/_components";

const BlogPage = () => {
  const searchParams = new URLSearchParams(window.location.search);
  const [blogInfo, setBlogInfo] = useState<any>(null);

  useEffect(() => {
    getBlog();
  }, []);

  const getBlog = async () => {
    const id = searchParams.get('id');
    if (id) {
      const res = await CmsService.getBlog(Number(id)) as any;
      if (res?.isSucceed) {
        setBlogInfo(res?.data);
      }
    }
  }

  return (
    <div className="custom-container">
      <div className="content__wrapper products__content-wrapper">
        <div className="content__inner w-full">
          <WebDirectional items={[
            { path: `/?id=${blogInfo?.blogId}`, name: blogInfo?.blogTitle }
          ]} />
          <div className="blog-content">
            {blogInfo && blogInfo.blogContent ? (
              <div dangerouslySetInnerHTML={{__html: blogInfo.blogContent}}></div>
            ) : null}
          </div>
        </div>
      </div>
    </div>
  );
};

export default BlogPage;
