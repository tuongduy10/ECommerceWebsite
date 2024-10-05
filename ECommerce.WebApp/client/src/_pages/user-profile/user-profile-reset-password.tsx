import MuiIcon from "src/_shares/_components/mui-icon/mui-icon.component";
import { WebDirectional } from "src/_shares/_components";
import { useEffect, useRef, useState } from "react";
import UserService from "src/_cores/_services/user.service";
import { FAIL_MESSAGE } from "src/_cores/_enums/message.enum";
import SessionService from "src/_cores/_services/session.service";
import { useNavigate } from "react-router-dom";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { useAuthStore } from "src/_cores/_store/root-store";
import { useDispatch } from "react-redux";
import { logout, setAccessToken, setUser } from "src/_cores/_reducers/auth.reducer";
import { ICON_NAME } from "src/_shares/_components/mui-icon/_enums/mui-icon.enum";
import { show, showError, showSuccess } from "src/_cores/_reducers/alert.reducer";

export default function UserProfileResetPasswordPage() {
    const [loading, setLoading] = useState(false);
    const authStore = useAuthStore();
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const passwordRef = useRef<any>(null);
    const newPasswordRef = useRef<any>(null);
    const reNewPasswordRef = useRef<any>(null);
    useEffect(() => {

    }, []);


    const submit = async () => {
        const param = {
            password: passwordRef.current.value,
            newPassword: newPasswordRef.current.value,
            reNewPassword: reNewPasswordRef.current.value,
        }
        const response = await UserService.resetPassword(param) as any;
        if (response) {
            if (!response.isSucceed) {
                dispatch(showError(response.message));
                return;
            }
            dispatch(showSuccess(response.message));
            dispatch(logout());
            navigate(ROUTE_NAME.LOGIN);
        }
    }

    return (
        <div className="tab-content">
            <div className="text-center">
                <div className="title"><strong>THÔNG TIN ĐĂNG NHẬP</strong></div>
            </div>
            <div className="user__info-form mx-auto">
                {/* Password input */}
                <div className="flex mb-3 items-center form-input">
                    <input
                        ref={passwordRef}
                        type="password"
                        id="clientPassword"
                        className="w-full form-input form-input-lg"
                        placeholder="Nhập mật khẩu"
                    />
                </div>
                {/* New password input */}
                <div className="flex mb-3 items-center form-input">
                    <input
                        ref={newPasswordRef}
                        type="password"
                        id="clientPassword"
                        className="w-full form-input form-input-lg"
                        placeholder="Nhập mật khẩu mới"
                    />
                </div>
                {/* Re new password input */}
                <div className="flex mb-3 items-center form-input">
                    <input
                        ref={reNewPasswordRef}
                        type="password"
                        id="clientPassword"
                        className="w-full form-input form-input-lg"
                        placeholder="Nhập lại mật khẩu moi"
                    />
                </div>
                <div className="login text-center text-lg-start mt-4 pt-2">
                    <button disabled={loading} className="signin btn-black" onClick={submit}>Cập nhật</button>
                </div>
            </div>
        </div>
    )
}