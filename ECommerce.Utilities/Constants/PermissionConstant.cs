using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reflection;
using System.Text;

namespace ECommerce.Utilities.Constants
{
    public static class PermissionConstant
    {
        public const string ACCESS_ALL = "ACCESS_ALL";
        public const string DEFAULT = "DEFAULT";
        public static class Common
        {
            public const string COMMON_CREATE = "COMMON_CREATE";
            public const string COMMON_READ = "COMMON_READ";
            public const string COMMON_UPDATE = "COMMON_UPDATE";
            public const string COMMON_DELETE = "COMMON_DELETE";
        }
        public static class User
        {
            public const string USER_LIST_CREATE = "USER_LIST_CREATE";
            public const string USER_LIST_READ = "USER_LIST_READ";
            public const string USER_LIST_UPDATE = "USER_LIST_UPDATE";
            public const string USER_LIST_DELETE = "USER_LIST_DELETE";

            public const string USER_DETAIL_CREATE = "USER_DETAIL_CREATE";
            public const string USER_DETAIL_READ = "USER_DETAIL_READ";
            public const string USER_DETAIL_UPDATE = "USER_DETAIL_UPDATE";
            public const string USER_DETAIL_DELETE = "USER_DETAIL_DELETE";
        }
        public static class Order
        {
            public const string ORDER_CREATE = "ORDER_CREATE";
            public const string ORDER_READ = "ORDER_READ";
            public const string ORDER_UPDATE = "ORDER_UPDATE";
            public const string ORDER_DELETE = "ORDER_DELETE";
        }
    }
}
