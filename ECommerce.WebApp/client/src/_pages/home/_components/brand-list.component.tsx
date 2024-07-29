import BrandItem from "./brand-item.component";
import InventoryService from 'src/_cores/_services/inventory.service';
import { useDispatch } from 'react-redux';
import { useEffect } from "react";
import { IBrand } from "src/_cores/_interfaces/inventory.interface";
import React from "react";
import { useHomeStore } from "src/_cores/_store/root-store";
import { setBrands } from "src/_cores/_reducers/home.reducer";
import { useLocation, useNavigate } from "react-router-dom";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";

const BrandList = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const homeStore = useHomeStore();
    const dispatch = useDispatch();
    const isBrandPage = location.pathname === ROUTE_NAME.BRANDS;

    useEffect(() => {
        getBrands(Number(homeStore.categorySelected));
    }, [homeStore.categorySelected]);

    const getBrands = (categoryId: number) => {
        const _param = {
            categoryId: categoryId || -1
        }
        const req = InventoryService.getBrands(_param);
        req.then(res => {
            if (res?.data) {
                dispatch(setBrands(res.data));
            }
        }).catch(error => {
            alert(error);
        });
    }

    const listDist = () => {
        const _list: any = [];
        if (homeStore.brands.length > 0) {
            homeStore.brands.forEach((item: IBrand) => {
                _list.push(item.name.substring(0, 1).toUpperCase());
            });
            return _list.filter((value: any, index: number, array: any) => array.indexOf(value) === index).sort();
        }
        return _list;
    }

    const backToList = () => {
        navigate({
            pathname: ROUTE_NAME.BRANDS
        });
    }

    const BrandListResult = () => {
        if (isBrandPage) {
            return homeStore.brands && homeStore.brands.length > 0 && (
                <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
                    {homeStore.brands.map((brand, idx) => {
                        return <BrandItem key={`home-brand-${brand.id}`} data={brand} />
                    })}
                </div>
            )
        }
        if (listDist().length > 0) {
            return listDist().map((dist: any) => (
                homeStore.alphabetSelected.map(alp => (
                    alp === dist ? (
                        <React.Fragment key={`alp-${alp}`}>
                            <h4>{alp}</h4>
                            <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
                                {homeStore.brands && homeStore.brands.length > 0 ?
                                    homeStore.brands.map((brand, idx) => {
                                        if (alp === brand.name.substring(0, 1).toUpperCase() && idx < 10) {
                                            return <BrandItem key={`home-brand-${brand.id}`} data={brand} />
                                        }
                                        return null;
                                    }) : null}
                            </div>
                        </React.Fragment>
                    ) : null
                ))
            ));
        }
        return null;
    }

    return (
        <div className="bran__list-items mb-4">
            <BrandListResult />
            {!isBrandPage && (
                <div className="w-100 text-center d-block">
                    <button 
                        className="bran__viewmore d-inline-block" 
                        style={{ cursor: 'pointer' }}
                        onClick={backToList}
                    >
                        Xem thêm
                    </button>
                </div>
            )}
        </div>
    )
}

export default BrandList