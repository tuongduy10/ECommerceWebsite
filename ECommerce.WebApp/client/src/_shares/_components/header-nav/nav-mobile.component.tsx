import { FOOTER_MENU_COL_3, HEADER_MENU } from "src/_configs/web.config";
import { ICON_NAME } from "../mui-icon/_enums/mui-icon.enum";
import MuiIcon from "../mui-icon/mui-icon.component";
import SearchForm, { SearchFormMobile } from "../search-form/search-form.component";
import { Fragment, useEffect, useRef, useState } from "react";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { Link } from "react-router-dom";
import { useCartStore } from "src/_cores/_store/root-store";
import CmsService from "src/_cores/_services/cms.service";

const HeaderNavMobile = () => {
  const cartStore = useCartStore();
  const [isOpenedNav, setIsOpenedNav] = useState(false);
  const [isOpenedSearch, setIsOpenedSearch] = useState(false);
  const wrapperListRef = useRef<any>(null);
  const logoRef = useRef<any>(null);
  const footerRef = useRef<any>(null);
  const [menuHeight, setMenuHeight] = useState(0);
  const [config, setConfig] = useState<any>(null);

  useEffect(() => {
    const getConfig = async () => {
      const res = await CmsService.getConfig() as any;
      if (res?.isSucceed) {
        setConfig(res.data);
      }
    };
    getConfig();
  }, []);

  useEffect(() => {
    const updateMenuHeight = () => {
      if (wrapperListRef.current && logoRef.current && footerRef.current) {
        requestAnimationFrame(() => {
          setMenuHeight(
            window.innerHeight -
            logoRef.current.clientHeight -
            footerRef.current.clientHeight
          );
        });
      }
    };
    updateMenuHeight();
    window.addEventListener("resize", updateMenuHeight); // Update on resize
    return () => window.removeEventListener("resize", updateMenuHeight);
  }, [config]);

  const onToggleNav = () => {
    setIsOpenedNav((toggle) => !toggle);
    document.body.style.overflow = !isOpenedNav ? "hidden" : "";
    document.body.style.position = !isOpenedNav ? "fixed" : "";
  };

  const onToggleSearch = () => {
    setIsOpenedSearch((toggle) => !toggle);
    document.body.style.overflow = !isOpenedSearch ? "hidden" : "";
    document.body.style.position = !isOpenedSearch ? "fixed" : "";
  };

  return (
    <Fragment>
      <nav className="nav__mobile">
        <div
          ref={wrapperListRef}
          className={`nav__mobile-list flex flex-col ${!isOpenedNav ? "nav-close" : "nav-open"
            }`}
          id="nav__mobile-list-open"
        >
          <div ref={logoRef} className="nav__mobile-logo flex p-4">
            <div className="w-full text-center relative">
              <span
                id="nav__mobile-list-close"
                className="absolute left-0"
                onClick={onToggleNav}
              >
                <MuiIcon name={ICON_NAME.FEATHER.X} />
              </span>
              <a href="/">
                <img
                  className="mx-auto max-h-[50px]"
                  src="https://hihichi.com/images/logo/logo_0052e058-a76f-46c6-ab29-0eaec8a3fc6c.png"
                  alt=""
                />
              </a>
            </div>
          </div>
          <div className="nav__list-mobile-wrapper py-4 pl-4" style={{ height: menuHeight + 'px' }}>
            <div className="nav__list-mobile h-full overflow-x-hidden overflow-y-auto">
              {HEADER_MENU.map((item: any) => (
                <div
                  key={`nav-mobile-${item.path}`}
                  className="nav__link-mobile pb-4"
                >
                  <a href={item.path}>{item.name}</a>
                </div>
              ))}
            </div>
          </div>
          <div ref={footerRef} className="nav__mobile-footer w-full mb-0">
            <ul className="nav__mobile-account p-4">
              <li className="pb-4">
                <button className="flex w-full">
                  <span className="icon">
                    <MuiIcon name={ICON_NAME.FEATHER.HELP_CIRCLE} />
                  </span>
                  <span className="text">Tra cứu đơn hàng</span>
                </button>
              </li>
              <li>
                <button className="flex w-full">
                  <span className="icon">
                    <MuiIcon name={ICON_NAME.FEATHER.USER} />
                  </span>
                  <span className="text">Tài khoản của tôi</span>
                </button>
              </li>
            </ul>
            {config && (
              <div className="nav__mobile-info p-4">
                <p className="pb-[1rem]">
                  <a href={`tel: ${config?.phoneNumber || ""}`}>Phone: {config?.phoneNumber || ""}</a>
                </p>
                <p className="pb-[1rem]">
                  <a href={`mailto: ${config?.mail || ""}`}>Mail: {config?.mail || ""}</a>
                </p>
                <p className={`pb-[1rem]`}>
                  <a href={`${config.facebookUrl}`} className="flex items-center">
                    <MuiIcon name={ICON_NAME.ROUNDED.FACEBOOK} className='mr-3' fontSize="small" /> Facebook
                  </a>
                </p>
                <p className={`pb-[1rem]`}>
                  <a href={`${config.youtubeUrl}`} className="flex items-center">
                    <MuiIcon name={ICON_NAME.YOUTUBE} className='mr-3' fontSize="small" /> Youtube
                  </a>
                </p>
                <p className={`pb-[1rem]`}>
                  <a href={`${config.instagramUrl}`} className="flex items-center">
                    <MuiIcon name={ICON_NAME.INSTAGRAM} className='mr-3' fontSize="small" /> Instagram
                  </a>
                </p>
                <p>
                  <a href={`${config.facebookUrl}`} className="flex items-center">
                    <MuiIcon name={ICON_NAME.MESSENGER} className='mr-3' fontSize="small" /> Messenger
                  </a>
                </p>
              </div>
            )}
          </div >
        </div >
        <div className="nav__mobile-action flex justify-between py-2">
          <label
            className={`${!isOpenedNav ? "hidden" : ""} overlay block m-0`}
            id="nav__overlay"
            onClick={onToggleNav}
          ></label>
          <label
            className="nav__menubar mb-0"
            id="nav__menubar-open"
            onClick={onToggleNav}
          >
            <MuiIcon name={ICON_NAME.FEATHER.MENU} />
          </label>

          <button
            className="header__mobile-searchicon"
            onClick={onToggleSearch}
          >
            <MuiIcon
              name={ICON_NAME.FEATHER.SEARCH}
              style={{ stroke: !isOpenedSearch ? "" : "#3b99fc" }}
            />
          </button>

          <Link to={ROUTE_NAME.USER_PROFILE_INFO} className="profile-mobile">
            {/* <span className="quantity"></span> */}
            <MuiIcon name={ICON_NAME.FEATHER.USER} />
          </Link>

          <a href="/" className="favorite-mobile">
            <span className="quantity">1</span>
            <MuiIcon name={ICON_NAME.FEATHER.HEART} />
          </a>

          <Link to={ROUTE_NAME.CART} className="cart-mobile minicart">
            <span className="quantity">{cartStore.totalQty}</span>
            <MuiIcon name={ICON_NAME.FEATHER.SHOPPING_BAG} />
          </Link>
        </div>
        {isOpenedSearch ? <SearchFormMobile /> : null}
      </nav >
      <div
        className={`search__overlay ${!isOpenedSearch ? "hidden" : ""}`}
        onClick={onToggleSearch}
      ></div>
    </Fragment >
  );
};

export default HeaderNavMobile;
