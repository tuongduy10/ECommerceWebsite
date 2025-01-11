import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { FOOTER_MENU_COL_3, FOOTER_MENU_COL_4 } from "src/_configs/web.config";
import CmsService from "src/_cores/_services/cms.service";
import { ICON_NAME } from "src/_shares/_components/mui-icon/_enums/mui-icon.enum";
import MuiIcon from "src/_shares/_components/mui-icon/mui-icon.component";

const Footer = () => {
    const navigate = useNavigate();
    const [blogs, setBlogs] = useState<any[]>([]);
    const [config, setConfig] = useState<any>(null);

    useEffect(() => {
        getBlogs();
        getConfig();
    }, []);

    const getConfig = async () => {
        const res = await CmsService.getConfig() as any;
        if (res?.isSucceed) {
            setConfig(res?.data);
            localStorage.setItem('config', JSON.stringify(res?.data));
        }
    }

    const getBlogs = async () => {
        const res = await CmsService.getBlogs() as any;
        if (res?.isSucceed) {
            const data = res?.data.filter((_: any) => _.status === 1);
            setBlogs(data);
        }
    }

    return (
        <footer className="footer">
            <div className="custom-container">
                <div className="footer__inner">
                    <div className="py-4">
                        <div className="flex flex-wrap justify-between">
                            <div className="footer__info">
                                <span className="footer__info-title">
                                    <p>Công ty</p>
                                </span>
                                <ul className="footer__info-list">
                                    {blogs.length > 0 && blogs.filter(_ => _.blogPosition === 1).map((item: any) => (
                                        <li key={`footer-col-1-${item.blogId}`} className="footer__info-link pb-2">
                                            <a href={`/blog?id=${item.blogId}`}>{item.blogTitle}</a>
                                        </li>
                                    ))}
                                </ul>
                            </div>
                            <div className="footer__info">
                                <span className="footer__info-title">
                                    <p>Chính sách</p>
                                </span>
                                <ul className="footer__info-list">
                                    {blogs.length > 0 && blogs.filter(_ => _.blogPosition === 2).map((item: any) => (
                                        <li key={`footer-col-1-${item.blogId}`} className="footer__info-link pb-2">
                                            <a href={`/blog?id=${item.blogId}`}>{item.blogTitle}</a>
                                        </li>
                                    ))}
                                </ul>
                            </div>
                            <div className="footer__info">
                                <span className="footer__info-title">
                                    <p>Tìm chúng tôi trên</p>
                                </span>
                                <ul className="footer__info-list">
                                    {config ? (<>
                                        <li className="footer__info-link pb-2">
                                            <a href={`${config.facebookUrl}`} className="flex items-center" target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.ROUNDED.FACEBOOK} className='mr-3' fontSize="small" /> Facebook
                                            </a>
                                        </li>
                                        <li className="footer__info-link pb-2">
                                            <a href={`${config.youtubeUrl}`} className="flex items-center" target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.YOUTUBE} className='mr-3' fontSize="small" /> Youtube
                                            </a>
                                        </li>
                                        <li className="footer__info-link pb-2">
                                            <a href={`${config.instagramUrl}`} className="flex items-center" target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.INSTAGRAM} className='mr-3' fontSize="small" /> Instagram
                                            </a>
                                        </li>
                                        <li className="footer__info-link pb-2">
                                            <a href={`${config.facebookUrl}`} className="flex items-center" target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.MESSENGER} className='mr-3' fontSize="small" /> Messenger
                                            </a>
                                        </li>
                                    </>) : null}
                                </ul>
                            </div>
                            <div className="footer__info">
                                <span className="footer__info-title">
                                    <p>Liên hệ</p>
                                </span>
                                <ul className="footer__info-list">
                                    {config ? (<>
                                        <li className="footer__info-link pb-2">
                                            <a href={`tel: ${config.phoneNumber}`} target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.PHONE_ANDROID} className='mr-2' fontSize="small" /> {config.phoneNumber}
                                            </a>
                                        </li>
                                        <li className="footer__info-link pb-2">
                                            <a href={`mailto:${config.mail}`} target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.OUTLINED.MAIL} className='mr-2' fontSize="small" /> Mail: {config.mail}
                                            </a>
                                        </li>
                                        <li className="footer__info-link pb-2">
                                            <a href={`${config.addressUrl}`} target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.OUTLINED.LOCATION} className='mr-2' fontSize="small" /> {config.address}
                                            </a>
                                        </li>
                                        <li className="footer__info-link pb-2">
                                            <a target="_blank" rel="noopener noreferrer">
                                                <MuiIcon name={ICON_NAME.OUTLINED.ACCESS_TIME} className='mr-2' fontSize="small" /> {config.startTime.split(":")[0]}:{config.startTime.split(":")[1]} - {config.endTime.split(":")[0]}:{config.endTime.split(":")[1]}
                                            </a>
                                        </li>
                                    </>) : null}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div className="footer__copyright">
                <div className="custom-container">
                    <div className="py-4">
                        <p className="footer__copyright-info">
                            <i className="far fa-copyright"></i> 2023 - Copyright by HiHiChi
                        </p>
                    </div>
                </div>
            </div>
            {config && (
                <div className="flex fixed w-[60px] h-[60px] bottom-[20px] right-[20px] cursor-pointer">
                    <a href={'https://zalo.me/' + config.phoneNumber} target="_blank" rel="rel">
                        <img src="/assets/icons/zalo.png" alt="name" />
                    </a>
                </div>
            )}
        </footer>
    );
}

export default Footer;