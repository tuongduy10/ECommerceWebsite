export const ROUTE_PREFIX = '';
export const ROUTE_NAME = {
    HOME: ROUTE_PREFIX + '/',
    LOGIN: ROUTE_PREFIX + '/login',
    SIGN_UP: ROUTE_PREFIX + '/sign-up',
    VERIFY_ACCOUNT: ROUTE_PREFIX + '/verify-account',
    FORGET_PASSWORD: ROUTE_PREFIX + '/forget-password',
    PRODUCT_LIST: ROUTE_PREFIX + '/product-list',
    AVAILABLE_PRODUCTS: ROUTE_PREFIX + '/available-products',
    PREORDER_PRODUCTS: ROUTE_PREFIX + '/preorder-products',
    HOT_SALE: ROUTE_PREFIX + '/hot-sale',
    NEW_PRODUCTS: ROUTE_PREFIX + '/new-products',
    BRANDS: ROUTE_PREFIX + '/brands',
    PRODUCT_DETAIL: ROUTE_PREFIX + '/product-detail',
    EXAMPLE: ROUTE_PREFIX + '/example',
    
    USER_PROFILE: ROUTE_PREFIX + '/user-profile',
    USER_PROFILE_INFO: ROUTE_PREFIX + '/user-profile/info',
    USER_PROFILE_RESET_PASSWORD: ROUTE_PREFIX + '/user-profile/reset-passowrd',
    USER_PROFILE_ORDER_LIST: ROUTE_PREFIX + '/user-profile/order-list',

    CART: ROUTE_PREFIX + '/cart',
    LOOK_UP_ORDERS: ROUTE_PREFIX + '/look-up-orders',
    PAYMENT: ROUTE_PREFIX + '/payment',
    BLOG: ROUTE_PREFIX + '/blog',
}

export const ADMIN_ROUTE_PREFIX = ROUTE_PREFIX + '/admin';
export const ADMIN_ROUTE_NAME = {
    DASHBOARD: ADMIN_ROUTE_PREFIX + '/',
    LOGIN: ADMIN_ROUTE_PREFIX + '/login',

    MANAGE_PRODUCT: ADMIN_ROUTE_PREFIX + '/manage-product',
    MANAGE_PRODUCT_ADD: ADMIN_ROUTE_PREFIX + '/manage-product/add',
    MANAGE_PRODUCT_DETAIL: ADMIN_ROUTE_PREFIX + '/manage-product/detail',
    MANAGE_PRODUCT_SETTINGS: ADMIN_ROUTE_PREFIX + '/manage-product/settings',

    MANAGE_USER: ADMIN_ROUTE_PREFIX + '/manage-user',
    MANAGE_USER_ADD: ADMIN_ROUTE_PREFIX + '/manage-user/add',
    MANAGE_USER_DETAIL: ADMIN_ROUTE_PREFIX + '/manage-user/detail',

    MANAGE_SALES_PAYMENT_METHODS: ADMIN_ROUTE_PREFIX + '/manage-sales/payment-methods',
    MANAGE_SALES_BRANDS: ADMIN_ROUTE_PREFIX + '/manage-sales/brands',
    MANAGE_SALES_SHOPS: ADMIN_ROUTE_PREFIX + '/manage-sales/shops',

    MANAGE_INVENTORY: ADMIN_ROUTE_PREFIX + '/manage-inventory',
    MANAGE_INVENTORY_CATEGORY: ADMIN_ROUTE_PREFIX + '/manage-inventory/category',
    MANAGE_INVENTORY_SUB_CATEGORY: ADMIN_ROUTE_PREFIX + '/manage-inventory/sub-category',
    MANAGE_INVENTORY_OPTIONS: ADMIN_ROUTE_PREFIX + '/manage-inventory/options',
    MANAGE_INVENTORY_ATTRIBUTES: ADMIN_ROUTE_PREFIX + '/manage-inventory/attributes',

    MANAGE_ORDERS: ADMIN_ROUTE_PREFIX + '/manage-orders',
    MANAGE_ORDERS_PENDING: ADMIN_ROUTE_PREFIX + '/manage-orders/pending',

    MANAGE_USERS: ADMIN_ROUTE_PREFIX + '/manage-users',
    MANAGE_STATISTICAL: ADMIN_ROUTE_PREFIX + '/manage-statistical',

    MANAGE_OMS_ORDER_LIST: ADMIN_ROUTE_PREFIX + '/manage-oms/order-list',

    MANAGE_BLOGS: ADMIN_ROUTE_PREFIX + '/manage-blogs',
}