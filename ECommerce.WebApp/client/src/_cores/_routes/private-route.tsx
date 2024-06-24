import { Navigate } from "react-router-dom"
import { ADMIN_ROUTE_NAME, ADMIN_ROUTE_PREFIX, ROUTE_NAME } from "../_enums/route-config.enum";
import SessionService from "../_services/session.service";

export const PrivateRoute = ({ children, ...rest }: any) => {
    const isAuthorized = SessionService.getAccessToken();
    if (!isAuthorized) {
        SessionService.deleteAccessToken();
        let navigateTo = ROUTE_NAME.LOGIN;
        if (window.location.pathname.includes(ADMIN_ROUTE_PREFIX)) {
            navigateTo = ADMIN_ROUTE_NAME.LOGIN;   
        }
        return <Navigate to={navigateTo} />
    }
    return children;
}