/* eslint-disable jsx-a11y/img-redundant-alt */
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

const LoginPage = () => {
  const [loading, setLoading] = useState(false);
  const authStore = useAuthStore();
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const userNameRef = useRef<any>(null);
  const passwordRef = useRef<any>(null);

  useEffect(() => {
    const token = SessionService.getAccessToken();
    if (token) {
      navigate(ROUTE_NAME.HOME);
    } else {
      dispatch(logout());
    }
  }, []);

  const submit = async () => {
    const param = {
      userPhone: userNameRef.current.value,
      password: passwordRef.current.value,
    }
    const response = await UserService.login(param) as any;
    if (response.isSucceed) {
      dispatch(setAccessToken(response.data));
      const user = await UserService.getUserInfo() as any;
      dispatch(setUser(user));
      navigate(ROUTE_NAME.HOME)
    }
  }

  return (
    <div className="custom-container py-4">
      <div className="signup__wrapper">
        <WebDirectional items={[
          { path: '/login', name: 'Đăng nhập' }
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
                  {/* Password input */}
                  <div className="flex mb-3 items-center form-input">
                    <MuiIcon name="PASSWORD" />
                    <input
                      ref={passwordRef}
                      type="password"
                      id="clientPassword"
                      className="w-full form-input form-input-lg"
                      placeholder="Nhập mật khẩu"
                    />
                  </div>
                  <div className="flex w-full flex-nowrap flex-1 items-center justify-between">
                    <a href="/" className="text-base hover:text-blue-600">
                      Tạo tài khoản mới
                    </a>
                    <a href="/" className="text-base hover:text-blue-600">
                      Quên mật khẩu?
                    </a>
                  </div>

                  <div className="login text-center text-lg-start mt-4 pt-2">
                    <button disabled={loading} className="signin btn-black" onClick={submit}>Đăng nhập</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
};
export default LoginPage;
