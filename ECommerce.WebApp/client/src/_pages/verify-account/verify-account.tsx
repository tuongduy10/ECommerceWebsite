import { useEffect } from "react";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { show, showSuccess } from "src/_cores/_reducers/alert.reducer";
import UserService from "src/_cores/_services/user.service";

const VerifyAccountPage = () => {
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const searchParams = new URLSearchParams(window.location.search);
    const token = searchParams.get('token');

    useEffect(() => {
        async function verifyAccount() {
            const response = await UserService.verifyAccount(token || '') as any;
            if (response?.isSucceed) {
                dispatch(showSuccess(response.message));
                navigate({ pathname: ROUTE_NAME.LOGIN });
            }
        }
        verifyAccount();
    }, []);
    return (<></>);
}

export default VerifyAccountPage;