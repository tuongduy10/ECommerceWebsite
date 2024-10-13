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

export default function SignUpPage() {
    const [loading, setLoading] = useState(false);
    const authStore = useAuthStore();
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const userNameRef = useRef<any>(null);
    const fullNameRef = useRef<any>(null);
    const emailRef = useRef<any>(null);
    const passwordRef = useRef<any>(null);
    const rePasswordRef = useRef<any>(null);
    useEffect(() => {

    }, []);


    const submit = async () => {
        const param = {
            userFullName: fullNameRef.current.value,
            userPhone: userNameRef.current.value,
            userMail: emailRef.current.value,
            // password: passwordRef.current.value,
            // rePassword: rePasswordRef.current.value,
        }
        const response = await UserService.signUp(param) as any;
        if (response) {
            if (!response.isSucceed) {
                dispatch(showError(response.message));
                return;
            }
            dispatch(show(response.message));
            navigate({
                pathname: ROUTE_NAME.LOGIN
            });
        }
    }

    return (
        <div className="custom-container py-4">
            <div className="signup__wrapper">
                <WebDirectional items={[
                    { path: '/sign-up', name: 'Đăng ký' }
                ]} />
                <section className="min-h-screen">
                    <div className="container mx-auto">
                        <div className="lg:flex justify-center items-center h-full">
                            <div className="w-full md:w-full sm:w-full lg:w-1/2 xl:w-2/5 px-4 md:px-6 lg:px-8 xl:pl-8">
                                <div className="w-full h-auto">
                                    <div className="tab-content">
                                        <div className="text-center">
                                            <div className="title"><strong>THÔNG TIN CÁ NHÂN</strong></div>
                                        </div>
                                        {/* Full name input */}
                                        <div className="flex mb-4 items-center form-input">
                                            <input
                                                ref={fullNameRef}
                                                type="text"
                                                id="clientPhoneNumber"
                                                className="w-full form-input form-input-lg"
                                                placeholder="Họ tên"
                                                autoComplete="off"
                                            />
                                        </div>
                                        {/* Email input */}
                                        <div className="flex mb-4 items-center form-input">
                                            <input
                                                ref={emailRef}
                                                type="text"
                                                id="clientPhoneNumber"
                                                className="w-full form-input form-input-lg"
                                                placeholder="Email"
                                                autoComplete="off"
                                            />
                                        </div>
                                        <div className="text-center">
                                            <div className="title"><strong>THÔNG TIN ĐĂNG NHẬP</strong></div>
                                        </div>
                                        {/* Phonenumber input */}
                                        <div className="flex mb-4 items-center form-input">
                                            <input
                                                ref={userNameRef}
                                                type="text"
                                                id="clientPhoneNumber"
                                                className="w-full form-input form-input-lg"
                                                placeholder="Số điện thoại"
                                                autoComplete="off"
                                            />
                                        </div>
                                        {/* Password input */}
                                        {/* <div className="flex mb-3 items-center form-input">
                                            <input
                                                ref={passwordRef}
                                                type="password"
                                                id="clientPassword"
                                                className="w-full form-input form-input-lg"
                                                placeholder="Nhập mật khẩu"
                                            />
                                        </div> */}
                                        {/* Re password input */}
                                        {/* <div className="flex mb-3 items-center form-input">
                                            <input
                                                ref={rePasswordRef}
                                                type="password"
                                                id="clientPassword"
                                                className="w-full form-input form-input-lg"
                                                placeholder="Nhập lại mật khẩu"
                                            />
                                        </div> */}
                                        <div className="login text-center text-lg-start mt-4 pt-2">
                                            <button disabled={loading} className="signin btn-black" onClick={submit}>Đăng ký</button>
                                        </div>
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