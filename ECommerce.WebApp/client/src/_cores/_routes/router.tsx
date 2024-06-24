import {
  HomePage,
  LoginPage,
  ProductDetailPage,
  UserProfilePage,
  CartPage,
  BlogPage,
  ExamplePage,
  ProductListPage,
  PaymentPage,
  UserProfileOrderList,
} from "src/_pages";
import { RouterProvider, createBrowserRouter } from "react-router-dom";
import DefaultLayout from "src/_shares/_layouts/default-layout/default-layout.component";
import AdminLayout from "src/_shares/_layouts/admin-layout/admin-layout.component";
import {
  Login,
  Dashboard,
  ProductList,
  UserList,
  ProductDetail,
  UserDetail,
  Category,
  SubCategory,
  Options,
  Attributes,
  OrderList,
  PaymentMethod,
  Blog,
  ProductSettings,
} from "src/_pages/admin/components";
import { PrivateRoute } from "./private-route";
import { ADMIN_ROUTE_NAME, ROUTE_NAME } from "../_enums/route-config.enum";
import { NotFoundLayout } from "src/_shares/_layouts/error-layout/notfound-layout";
import UserProfileLayout from "src/_shares/_layouts/user-profile-layout/user-profile-layout";
import BrandPage from "src/_pages/brand/brand.page";
const Router = () => {
  const browserRoutes = createBrowserRouter([
    {
      path: "/",
      element: <DefaultLayout />,
      children: [
        { path: ROUTE_NAME.HOME, element: <HomePage /> },
        { path: ROUTE_NAME.EXAMPLE, element: <ExamplePage /> },
        { path: ROUTE_NAME.LOGIN, element: <LoginPage /> },
        {
          path: ROUTE_NAME.USER_PROFILE,
          element:
            <PrivateRoute>
              <UserProfileLayout />
            </PrivateRoute>,
          children: [
            { path: ROUTE_NAME.USER_PROFILE_INFO, element: <UserProfilePage /> },
            { path: ROUTE_NAME.USER_PROFILE_ORDER_LIST, element: <UserProfileOrderList /> }
          ]
        },
        { path: ROUTE_NAME.CART, element: <CartPage /> },
        { path: ROUTE_NAME.PAYMENT, element: <PaymentPage /> },
        { path: ROUTE_NAME.BLOG, element: <BlogPage /> },
        { path: ROUTE_NAME.PRODUCT_LIST, element: <ProductListPage /> },
        { path: ROUTE_NAME.AVAILABLE_PRODUCTS, element: <ProductListPage /> },
        { path: ROUTE_NAME.PREORDER_PRODUCTS, element: <ProductListPage /> },
        { path: ROUTE_NAME.BRANDS, element: <BrandPage /> },
        { path: ROUTE_NAME.HOT_SALE, element: <ProductListPage /> },
        { path: ROUTE_NAME.NEW_PRODUCTS, element: <ProductListPage /> },
        { path: ROUTE_NAME.PRODUCT_DETAIL, element: <ProductDetailPage /> },
      ],
    },
    { path: ADMIN_ROUTE_NAME.LOGIN, element: <Login /> },
    {
      path: '',
      element: <AdminLayout />,
      children: [
        { path: ADMIN_ROUTE_NAME.DASHBOARD, element: <PrivateRoute><Dashboard /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_CATEGORY, element: <PrivateRoute><Category /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_SUB_CATEGORY, element: <PrivateRoute><SubCategory /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_OPTIONS, element: <PrivateRoute><Options /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_ATTRIBUTES, element: <PrivateRoute><Attributes /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_SALES_PAYMENT_METHODS, element: <PrivateRoute><PaymentMethod /></PrivateRoute> },

        { path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT, element: <PrivateRoute><ProductList /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT_ADD, element: <PrivateRoute><ProductDetail /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT_DETAIL, element: <PrivateRoute><ProductDetail /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT_SETTINGS, element: <PrivateRoute><ProductSettings /></PrivateRoute> },

        { path: ADMIN_ROUTE_NAME.MANAGE_USER, element: <PrivateRoute><UserList /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_USER_DETAIL, element: <PrivateRoute><UserDetail /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_OMS_ORDER_LIST, element: <PrivateRoute><OrderList /></PrivateRoute> },
        { path: ADMIN_ROUTE_NAME.MANAGE_BLOGS, element: <PrivateRoute><Blog /></PrivateRoute> },
      ],
    },
    { path: '*', element: <NotFoundLayout /> }
  ]);

  return <RouterProvider router={browserRoutes} />;
};

export default Router;
