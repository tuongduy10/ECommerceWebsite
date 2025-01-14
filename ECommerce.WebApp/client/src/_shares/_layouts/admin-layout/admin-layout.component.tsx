import * as React from 'react';
import { styled, createTheme, ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';
import MuiDrawer from '@mui/material/Drawer';
import Box from '@mui/material/Box';
import MuiAppBar, { AppBarProps as MuiAppBarProps } from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import List from '@mui/material/List';
import Typography from '@mui/material/Typography';
import Divider from '@mui/material/Divider';
import IconButton from '@mui/material/IconButton';
import Container from '@mui/material/Container';
import Grid from '@mui/material/Grid';
import Paper from '@mui/material/Paper';
import MenuIcon from '@mui/icons-material/Menu';
import StorefrontIcon from '@mui/icons-material/Storefront';
import ArticleIcon from '@mui/icons-material/Article';
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import { Accordion, AccordionDetails, AccordionSummary, Collapse, ListItemButton, ListItemIcon, ListItemText, Menu, MenuItem } from '@mui/material';
import ListSubheader from '@mui/material/ListSubheader';
import HomeRoundedIcon from '@mui/icons-material/HomeRounded';
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';
import PeopleIcon from '@mui/icons-material/People';
import BarChartIcon from '@mui/icons-material/BarChart';
import AssignmentIcon from '@mui/icons-material/Assignment';
import InventoryIcon from '@mui/icons-material/Inventory';
import CategoryIcon from '@mui/icons-material/Category';
import StorageIcon from '@mui/icons-material/Storage';
import AccountCircle from '@mui/icons-material/AccountCircle';
import { Outlet, useNavigate } from 'react-router-dom';
import SessionService from 'src/_cores/_services/session.service';
import { ADMIN_ROUTE_NAME, ROUTE_NAME } from 'src/_cores/_enums/route-config.enum';
import { ExpandLess, ExpandMore } from '@mui/icons-material';
import { useAuthStore } from 'src/_cores/_store/root-store';
import { useDispatch } from 'react-redux';
import { logout } from 'src/_cores/_reducers/auth.reducer';
import { ROLE_KEY } from 'src/_cores/_constants/role-constants';
import { USER_ROLE } from 'src/_cores/_enums/user.enum';

const mainListItems = [
    { 
        name: "dashboard", 
        icon: <HomeRoundedIcon />, 
        label: "Trang chủ", 
        requiredRoles: [],
        path: "/admin" 
    },
    {
        name: "product",
        icon: <StorageIcon />,
        label: "Sản phẩm",
        requiredRoles: [ROLE_KEY.ADMIN, ROLE_KEY.DISTRIBUTOR],
        path: "",
        childs: [
            {
                name: 'list',
                label: 'Danh sách sản phẩm',
                path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT,
            },
            {
                name: 'add',
                label: 'Thêm sản phẩm',
                path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT_ADD,
            },
            {
                name: 'settings',
                label: 'Cài đặt',
                path: ADMIN_ROUTE_NAME.MANAGE_PRODUCT_SETTINGS,
            },
        ]
    },
    {
        name: "inventory",
        icon: <InventoryIcon />,
        label: "Kho",
        requiredRoles: [ROLE_KEY.ADMIN],
        path: "",
        childs: [
            {
                name: 'category',
                label: 'Danh mục',
                path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_CATEGORY,
            },
            {
                name: 'subCategory',
                label: 'Loại sản phẩm',
                path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_SUB_CATEGORY,
            },
            {
                name: 'options',
                label: 'Thông tin tùy chọn',
                path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_OPTIONS,
            },
            {
                name: 'attributes',
                label: 'Thông tin chi tiết',
                path: ADMIN_ROUTE_NAME.MANAGE_INVENTORY_ATTRIBUTES,
            },
        ]
    },
    {
        name: "store",
        icon: <StorefrontIcon />,
        label: "Bán hàng",
        requiredRoles: [ROLE_KEY.ADMIN],
        path: "",
        childs: [
            { name: 'paymentMethods', label: 'Phương thức thanh toán', path: ADMIN_ROUTE_NAME.MANAGE_SALES_PAYMENT_METHODS },
            { name: 'shops', label: 'Cửa hàng', path: ADMIN_ROUTE_NAME.MANAGE_SALES_SHOPS, },
            { name: 'brands', label: 'Thương hiệu', path: ADMIN_ROUTE_NAME.MANAGE_SALES_BRANDS, },
        ]
    },
    {
        name: "order",
        icon: <ShoppingCartIcon />,
        label: "Đơn hàng",
        path: "",
        requiredRoles: [ROLE_KEY.ADMIN, ROLE_KEY.DISTRIBUTOR],
        childs: [
            {
                name: 'order-list',
                label: 'Danh sách Đơn hàng',
                path: ADMIN_ROUTE_NAME.MANAGE_OMS_ORDER_LIST,
            },
        ]
    },
    {
        name: "user",
        icon: <PeopleIcon />,
        label: "Người dùng",
        path: "",
        requiredRoles: [ROLE_KEY.ADMIN],
        childs: [
            {
                name: 'list',
                label: 'Danh sách người dùng',
                path: ADMIN_ROUTE_NAME.MANAGE_USER,
            },
            {
                name: 'detail',
                label: 'Tạo tài khoản bán hàng',
                path: ADMIN_ROUTE_NAME.MANAGE_USER_DETAIL,
            }
        ]
    },
    {
        name: 'blogs',
        icon: <ArticleIcon />,
        label: 'Nội dung',
        requiredRoles: [ROLE_KEY.ADMIN],
        path: ADMIN_ROUTE_NAME.MANAGE_BLOGS,
    },
    {
        name: "statistical",
        icon: <BarChartIcon />,
        label: "Thống kê",
        requiredRoles: [ROLE_KEY.ADMIN],
        path: ""
    },
];

const secondListItems = [
    {
        name: "statistical",
        icon: <AssignmentIcon />,
        label: "Tháng hiện tại",
        requiredRoles: [ROLE_KEY.ADMIN],
        path: ADMIN_ROUTE_NAME.DASHBOARD
    },
    {
        name: "statisticalLastQuarter",
        icon: <AssignmentIcon />,
        label: "Quý trước",
        requiredRoles: [ROLE_KEY.ADMIN],
        path: ADMIN_ROUTE_NAME.DASHBOARD
    },
    {
        name: "statisticalYearEnd",
        icon: <AssignmentIcon />,
        label: "Tổng kết năm",
        requiredRoles: [ROLE_KEY.ADMIN],
        path: ADMIN_ROUTE_NAME.DASHBOARD
    },
];

const drawerWidth: number = 240;

interface AppBarProps extends MuiAppBarProps {
    open?: boolean;
}

const AppBar = styled(MuiAppBar, {
    shouldForwardProp: (prop) => prop !== 'open',
})<AppBarProps>(({ theme, open }) => ({
    zIndex: theme.zIndex.drawer + 1,
    transition: theme.transitions.create(['width', 'margin'], {
        easing: theme.transitions.easing.sharp,
        duration: theme.transitions.duration.leavingScreen,
    }),
    ...(open && {
        marginLeft: drawerWidth,
        width: `calc(100% - ${drawerWidth}px)`,
        transition: theme.transitions.create(['width', 'margin'], {
            easing: theme.transitions.easing.sharp,
            duration: theme.transitions.duration.enteringScreen,
        }),
    }),
}));

const Drawer = styled(MuiDrawer, { shouldForwardProp: (prop) => prop !== 'open' })(
    ({ theme, open }) => ({
        '& .MuiDrawer-paper': {
            position: 'relative',
            whiteSpace: 'nowrap',
            width: drawerWidth,
            transition: theme.transitions.create('width', {
                easing: theme.transitions.easing.sharp,
                duration: theme.transitions.duration.enteringScreen,
            }),
            boxSizing: 'border-box',
            ...(!open && {
                overflowX: 'hidden',
                transition: theme.transitions.create('width', {
                    easing: theme.transitions.easing.sharp,
                    duration: theme.transitions.duration.leavingScreen,
                }),
                width: theme.spacing(7),
                [theme.breakpoints.up('sm')]: {
                    width: theme.spacing(9),
                },
            }),
        },
    }),
);

// TODO remove, this demo shouldn't need to reset the theme.
const defaultTheme = createTheme();

export default function AdminLayout() {
    const navigate = useNavigate();
    const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
    const [open, setOpen] = React.useState(true);
    const [selectedItem, setSelectedItem] = React.useState('');
    const authStore = useAuthStore();
    const dispatch = useDispatch();

    React.useEffect(() => {
        if (authStore.user?.role === ROLE_KEY.BUYER) {
            dispatch(logout());
            navigate(ROUTE_NAME.LOGIN);
        }
    }, []);

    const toggleDrawer = () => {
        setOpen(!open);
        if (open) {
            setSelectedItem('');
        }
    };

    const goToPage = (path: string) => {
        if (path) {
            navigate(path)
        }
    }

    const toggleItem = (name: string) => {
        if (name === selectedItem) {
            setSelectedItem('');
        } else {
            setSelectedItem(name);
            setOpen(true);
        }
    }

    const renderListItem = (listItems: any[]) => {
        return listItems.filter((item: any) => item.requiredRoles.length === 0 || item.requiredRoles.includes(authStore.user?.role)).map((item: any) => (
            item.childs && item.childs?.length > 0
                ? (<React.Fragment key={item.name}>
                    <ListItemButton onClick={() => toggleItem(item.name)}>
                        <ListItemIcon>
                            {item.icon}
                        </ListItemIcon>
                        <ListItemText primary={item.label} />
                        {selectedItem === item.name ? <ExpandLess /> : <ExpandMore />}
                    </ListItemButton>
                    <Collapse in={selectedItem === item.name} timeout="auto" unmountOnExit>
                        <List component="div" disablePadding>
                            {item.childs.map((child: any) => (
                                <ListItemButton key={child.name} sx={{ pl: 4 }} onClick={() => goToPage(child.path)}>
                                    <ListItemText primary={child.label} />
                                </ListItemButton>
                            ))}
                        </List>
                    </Collapse>
                </React.Fragment>) : (
                    <ListItemButton key={item.name} onClick={() => goToPage(item.path)}>
                        <ListItemIcon>
                            {item.icon}
                        </ListItemIcon>
                        <ListItemText primary={item.label} />
                    </ListItemButton>
                )
        ))
    }

    return (
        <ThemeProvider theme={defaultTheme}>
            <Box className="flex">
                <CssBaseline />
                <AppBar position="absolute" open={open}>
                    <Toolbar className='pr-[24px]'>
                        <IconButton
                            edge="start"
                            color="inherit"
                            aria-label="open drawer"
                            onClick={toggleDrawer}
                            sx={{
                                marginRight: '36px',
                                ...(open && { display: 'none' }),
                            }}
                        >
                            <MenuIcon />
                        </IconButton>
                        <Typography
                            component="h1"
                            variant="h6"
                            color="inherit"
                            noWrap
                            sx={{ flexGrow: 1 }}
                        >
                            Quản trị
                        </Typography>
                        <IconButton
                            size="large"
                            aria-label="account of current user"
                            aria-controls="menu-appbar"
                            aria-haspopup="true"
                            onClick={(event) => setAnchorEl(event.currentTarget)}
                            color="inherit"
                        >
                            <AccountCircle />
                        </IconButton>
                        <Menu
                            id="menu-appbar"
                            anchorEl={anchorEl}
                            keepMounted
                            open={Boolean(anchorEl)}
                            onClose={() => setAnchorEl(null)}
                        >
                            <MenuItem onClick={() => setAnchorEl(null)}>Hồ sơ</MenuItem>
                            <MenuItem onClick={() => {
                                setAnchorEl(null);
                                dispatch(logout());
                                window.location.href = ADMIN_ROUTE_NAME.LOGIN;
                            }}>Đăng xuất</MenuItem>
                        </Menu>
                    </Toolbar>
                </AppBar>
                <Drawer variant="permanent" open={open}>
                    <Toolbar
                        className="flex items-center justify-end"
                        sx={{ px: [1] }}
                    >
                        <IconButton onClick={toggleDrawer}>
                            <ChevronLeftIcon />
                        </IconButton>
                    </Toolbar>
                    <Divider />
                    <List component="nav">
                        <React.Fragment>
                            {renderListItem(mainListItems)}
                        </React.Fragment>
                        <Divider sx={{ my: 1 }} />
                        <React.Fragment>
                            <ListSubheader component="div" inset>
                                Báo cáo
                            </ListSubheader>
                            {renderListItem(secondListItems)}
                        </React.Fragment>
                    </List>
                </Drawer>
                <Box
                    className='overflow-auto grow h-screen'
                    component="main"
                    sx={{ backgroundColor: (theme) => theme.palette.grey[100] }}
                >
                    <Toolbar />
                    <Container maxWidth={false} sx={{ mt: 4, mb: 4 }}>
                        <Paper className='flex flex-col h-full' sx={{ p: 2 }}>
                            <Outlet />
                        </Paper>
                    </Container>
                </Box>
            </Box>
        </ThemeProvider >
    );
}