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

export default function ForgetPasswordPage() {
    const [loading, setLoading] = useState(false);
    const authStore = useAuthStore();
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const userNameRef = useRef<any>(null);
    useEffect(() => {

    }, []);


    const submit = async () => {
        const response = await UserService.forgetPassword(userNameRef.current.value) as any;
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
        <div className="custom-container py-4">
            <div className="signup__wrapper">
                <WebDirectional items={[
                    { path: '/forget-password', name: 'Quên mật khẩu' },
                ]} />
                <section className="min-h-screen">
                    <div className="container mx-auto">
                        <div className="lg:flex justify-center items-center h-full">
                            <div className="w-full sm:w-full md:w-full lg:w-1/2 xl:w-1/2 flex-none md:flex-auto lg:flex-initial xl:flex-initial">
                                <img
                                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                                    className=""
                                    alt="Sample Image"
                                />
                            </div>
                            <div className="w-full md:w-full sm:w-full lg:w-1/2 xl:w-2/5 px-4 md:px-6 lg:px-8 xl:pl-8">
                                <div className="w-full h-auto">
                                    {/* Phonenumber input */}
                                    <div className="flex mb-4 items-center form-input">
                                        <MuiIcon name="PHONE_ANDROID" />
                                        <input
                                            ref={userNameRef}
                                            type="text"
                                            id="clientPhoneNumber"
                                            className="w-full form-input form-input-lg"
                                            placeholder="Nhập số điện thoại"
                                            autoComplete="off"
                                        />
                                    </div>
                                    <div className="login text-center text-lg-start mt-4 pt-2">
                                        <button disabled={loading} className="signin btn-black" onClick={submit}>Tiếp tục</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    )
}