import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";
import { WebDirectional } from "src/_shares/_components";
import UserProfileOrderList from "../user-profile/user-profile-order-list.page";


const LookUpOrdersPage = () => {
    return (
        <div className="custom-container">
            <div className="content__inner">
                <WebDirectional items={[
                    { path: ROUTE_NAME.LOOK_UP_ORDERS, name: 'Tra cứu đơn hàng' }
                ]} />
                <div className="card-content">
                    <div className="cart-title text-center">TRA CỨU ĐƠN HÀNG</div>
                    <UserProfileOrderList enableFilter={true} />
                </div>
            </div>
        </div>
    )
}

export default LookUpOrdersPage;