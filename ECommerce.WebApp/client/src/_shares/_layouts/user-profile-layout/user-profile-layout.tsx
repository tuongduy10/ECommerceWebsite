import { IconButton, Menu, MenuItem } from "@mui/material";
import { useState } from "react";
import { useDispatch } from "react-redux";
import { Outlet, useNavigate } from "react-router-dom";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { logout } from "src/_cores/_reducers/auth.reducer";
import { useAuthStore, useUserStore } from "src/_cores/_store/root-store";
import { MuiIcon, WebDirectional } from "src/_shares/_components";
import MoreVertIcon from '@mui/icons-material/MoreVert';
import { ICON_NAME } from "src/_shares/_components/mui-icon/_enums/mui-icon.enum";

const UserProfileLayout = () => {
    const navigate = useNavigate();
    const [anchorEl, setAnchorEl] = useState<null | HTMLElement>(null);
    const open = Boolean(anchorEl);
    const [selectedMenu, setSelectedMenu] = useState('userInfo');
    const userStore = useUserStore();
    const authStore = useAuthStore();
    const dispatch = useDispatch();

    const PROFILE_MENU_ITEMS = [
        {
            code: 'notifications',
            name: 'Thông báo',
            icon: ICON_NAME.FEATHER.BELL,
            command: () => {

            }
        },
        {
            code: ROUTE_NAME.USER_PROFILE_INFO,
            name: 'Thông tin cá nhân',
            icon: ICON_NAME.FEATHER.INFO,
            command: () => {
                navigate(ROUTE_NAME.USER_PROFILE_INFO);
            }
        },
        {
            code: ROUTE_NAME.USER_PROFILE_ORDER_LIST,
            name: 'Lịch sử đơn hàng',
            icon: ICON_NAME.FEATHER.LIST,
            command: () => {
                navigate(ROUTE_NAME.USER_PROFILE_ORDER_LIST);
            }
        },
        {
            code: 'changePassword',
            name: 'Đổi mật khẩu',
            icon: ICON_NAME.FEATHER.EDIT_3,
            command: () => {
                navigate(ROUTE_NAME.USER_PROFILE_RESET_PASSWORD);
            }
        },
        {
            code: 'logout',
            name: 'Đăng xuất',
            icon: ICON_NAME.FEATHER.LOG_OUT,
            command: () => {
                dispatch(logout());
                navigate(ROUTE_NAME.LOGIN);
            }
        },
    ]
    return (
        <div className="custom-container">
            <div className="content__wrapper products__content-wrapper">
                <div className="content__inner w-full">
                    <WebDirectional items={[
                        { path: ROUTE_NAME.USER_PROFILE, name: 'Hồ sơ cá nhân' }
                    ]} />
                    <div className="user__profile-wrapper grid grid-cols-12 gap-2">
                        <div className="col-span-12 md:col-span-2 md:mb-4">
                            <div className="tabs-control">
                                <div className="control-selectlist">
                                    <IconButton
                                        aria-expanded={open ? 'true' : undefined}
                                        onClick={(e) => { setAnchorEl(e.currentTarget) }}
                                        size="small"
                                    >
                                        <MoreVertIcon />
                                    </IconButton>
                                    <Menu
                                        anchorEl={anchorEl}
                                        open={open}
                                        onClose={() => setAnchorEl(null)}
                                    >
                                        {PROFILE_MENU_ITEMS.map((option) => (
                                            <MenuItem key={option.code} onClick={() => option.command()}>
                                                {option.name}
                                            </MenuItem>
                                        ))}
                                    </Menu>
                                </div>
                                <ul className="control-list">
                                    {PROFILE_MENU_ITEMS.map(_ => (
                                        <li key={_.code} className="mb-2">
                                            <span className={`flex items-center cursor-pointer ${_.code === selectedMenu && 'active'}`}
                                                style={{ whiteSpace: 'nowrap' }}
                                                onClick={() => _.command()}>
                                                <span className="mr-2 relative" style={{ height: '24px' }}>
                                                    <MuiIcon name={_.icon} />
                                                    {/* {_.code === 'notifications' && (
                                                        <div className="point-red-quantity" style={{ top: '12px', left: '20px' }}>1</div>
                                                    )} */}
                                                </span>
                                                <span>{_.name}</span>
                                            </span>
                                        </li>
                                    ))}
                                    <hr />
                                </ul>
                            </div>
                        </div>
                        <div className="col-span-12 md:col-span-10 mb-4">
                            <div className="tabs-content">
                                <Outlet />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div >
    )
}

export default UserProfileLayout;