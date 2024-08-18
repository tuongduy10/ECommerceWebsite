import { Autocomplete } from "@mui/material";
import MuiIcon from "../mui-icon/mui-icon.component";
import { ICON_NAME } from "../mui-icon/_enums/mui-icon.enum";
import { useDebounce } from "src/_cores/_hooks/search-debounce";
import { useEffect, useState } from "react";
import ProductService from "src/_cores/_services/product.service";
import { IProduct } from "src/_cores/_interfaces/product.interface";
import { useNavigate } from "react-router-dom";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";

export const SearchFormMobile = (props: any) => {
    const [searchKey, setSearchKey] = useState('');
    const debounceSearch = useDebounce(searchKey, 400);
    const [products, setProducts] = useState<IProduct[]>([]);

    useEffect(() => {
        if (debounceSearch) {
            const params = {
                keyword: debounceSearch,
                pageIndex: 1,
            }
            const loadProducts = async () => {
                const res = await ProductService.getProductList(params);
                setProducts(res.data?.items);
            }
            loadProducts();
        }
    }, [debounceSearch]);

    const onChangeKeyword = (e: any) => {
        setSearchKey(e.target.value);
    }

    const goToDetail = (item: IProduct) => {
        window.location.href = `${ROUTE_NAME.PRODUCT_DETAIL}?id=${item.id}`;
    }
    return (
        <Autocomplete
            options={products}
            getOptionLabel={(option) => `${option.name}`}
            onChange={(event, value) => value && goToDetail(value)}
            noOptionsText={'Không có kết quả'}
            renderInput={(params) => (
                <div className={`searchform__wrapper py-2 px-[20px] md:hidden`}>
                    <div className="searchform input-group rounded w-full" style={{ padding: '0.375rem 0.75rem' }}>
                        <input {...params.inputProps} onChange={onChangeKeyword} value={searchKey} type="text" id="search-input" className="form-control w-full"
                            placeholder="Sản phẩm cần tìm" />
                    </div>
                    <div className="searchresult">
                        <div ref={params.InputProps.ref}></div>
                    </div>
                </div>
            )}
        />
    )
}

const SearchForm = (props: any) => {
    const [searchKey, setSearchKey] = useState('');
    const debounceSearch = useDebounce(searchKey, 400);
    const [products, setProducts] = useState<IProduct[]>([]);

    useEffect(() => {
        if (debounceSearch) {
            const params = {
                keyword: debounceSearch,
                pageIndex: 1,
            }
            const loadProducts = async () => {
                const res = await ProductService.getProductList(params);
                setProducts(res.data?.items);
            }
            loadProducts();
        }
    }, [debounceSearch]);

    const onChangeKeyword = (e: any) => {
        setSearchKey(e.target.value);
    }

    const goToDetail = (item: IProduct) => {
        window.location.href = `${ROUTE_NAME.PRODUCT_DETAIL}?id=${item.id}`;
    }

    return (
        <Autocomplete
            options={products}
            getOptionLabel={(option) => `${option.name}`}
            onChange={(event, value) => value && goToDetail(value)}
            noOptionsText={'Không có kết quả'}
            renderInput={(params) => (
                <span className="header-searchform header__top-link">
                    <span className="text">
                        <input {...params.inputProps} onChange={onChangeKeyword} value={searchKey} type="text" placeholder="Sản phẩm cần tìm" />
                    </span>
                    <span className="icon">
                        <MuiIcon name={ICON_NAME.FEATHER.SEARCH} />
                    </span>
                    <div className="absolute bottom-0 w-full" ref={params.InputProps.ref}></div>
                </span>
            )}
        />
    )
}

const options = ['Option 1', 'Option 2'];

export default SearchForm;