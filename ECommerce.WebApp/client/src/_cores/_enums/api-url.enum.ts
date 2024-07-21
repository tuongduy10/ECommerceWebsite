
export const COMMON_API_URL = {
    GET_DATA: '/posts',
    UPLOAD_FILES: '/common/upload',
    REMOVE_FILES: '/common/remove-files',
    PROVINCES: '/common/provinces',
    DISTRICTS: '/common/districts',
    WARDS: '/common/wards',
}

export const BLOG_API_URL = {
    GET_BLOG: '/blog/get-blog',
}

export const BRAND_API_URL = {
    GET_ALL_AVAILABLE: '/brandAPI/getAllAvailable',
    GET_ALL_AVAILABLE_IN_CATEGORY: '/brandAPI/getAllAvailableInCategory',
    GET_BRAND: '/brand/get-brand',
    GET_BRANDS: '/inventory/get-brands'
}

export const CATEGORY_API_URL = {
    GET_ALL: '/categoryAPI/getAll'
}

export const PRODUCT_API_URL = {
    PRODUCT_LIST: '/product/product-list',
    PRODUCT_MANAGED_LIST: '/product/product-managed-list',
    PRODUCT_DETAIL: '/product/product-detail',
    UPDATE_STATUS: '/product/update-status',
    DELETE: '/product/delete',
    SAVE: '/product/save',

    GET_SETTINGS: '/product/settings',
    UPDATE_SETTING: '/product/update-setting',
}

export const INVENTORY_API_URL = {
    ATTRIBUTES: '/inventory/attributes',
    SAVE_ATTRIBUTES: '/inventory/save-attributes',
    DELETE_ATTRIBUTE: '/inventory/delete-attribute',

    OPTIONS: '/inventory/options',
    SAVE_OPTIONS: '/inventory/save-options',
    DELETE_OPTION: '/inventory/delete-option',

    GET_BRAND: '/inventory/get-brand',
    ADD_BRAND: '/inventory/add-brand',
    UPDATE_BRAND: '/inventory/update-brand',
    DELETE_BRAND: '/inventory/delete-brand',

    CATEGORIES: '/inventory/get-categories',
    CATEGORY: '/inventory/get-category',
    UPDATE_CATEGORY: '/inventory/update-category',
    ADD_CATEGORY: '/inventory/add-category',
    DELETE_CATEGORY: '/inventory/delete-category',

    UPDATE_SUB_CATEGORY: '/inventory/update-sub-category',
    ADD_SUB_CATEGORY: '/inventory/add-sub-category',
    DELETE_SUB_CATEGORY: '/inventory/delete-sub-category',
    SUB_CATEGORIES: '/inventory/sub-categories',

    SAVE_SIZE: '/inventory/save-size',
}

export const SALES_API_URL = {
    PAYMENT_METHODS: '/sales/payment-methods',
    SAVE_PAYMENT_METHODS: '/sales/save-payment-method',
    DELETE_PAYMENT_METHODS: '/sales/delete-payment-method',

    GET_SHOP: '/sales/get-shop',
    GET_SHOPS: '/sales/get-shops',
    ADD_SHOP: '/sales/add-shop',
    UPDATE_SHOP: '/sales/update-shop',
    DELETE_SHOP: '/sales/delete-shop',
}
