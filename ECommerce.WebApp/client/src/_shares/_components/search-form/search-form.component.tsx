import { Autocomplete } from "@mui/material";
import MuiIcon from "../mui-icon/mui-icon.component";
import { ICON_NAME } from "../mui-icon/_enums/mui-icon.enum";

export const SearchFormMobile = (props: any) => {
    return (
        <Autocomplete
            options={options}
            renderInput={(params) => (
                <div className={`searchform__wrapper py-2 px-[20px] md:hidden`}>
                    <div className="searchform input-group rounded w-full" style={{ padding: '0.375rem 0.75rem' }}>
                        <input {...params.inputProps} type="text" id="search-input" className="form-control w-full"
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
    return (
        <Autocomplete
            options={options}
            renderInput={(params) => (
                <span className="header-searchform header__top-link">
                    <span className="text">
                        <input {...params.inputProps} type="text" placeholder="Sản phẩm cần tìm" />
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