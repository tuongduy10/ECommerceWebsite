import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import 'src/_pages/home/_styles/banner.css';
import { useEffect, useState } from 'react';
import InventoryService from 'src/_cores/_services/inventory.service';
import { useDispatch } from 'react-redux';
import { setBrands } from "src/_cores/_reducers/home.reducer";
import { BrandList } from "../home/_components";
import { WebDirectional } from "src/_shares/_components";
import { ROUTE_NAME } from "src/_cores/_enums/route-config.enum";

const BrandPage = () => {
    const dispatch = useDispatch();

    useEffect(() => {
        getBrands();
    }, []);

    const getBrands = () => {
        InventoryService.getBrands({}).then(res => {
            if (res?.data) {
                dispatch(setBrands(res.data));
            }
        }).catch(error => {
            console.log(error);
        });
    }

    return (
        <div className="custom-container">
            <div className="content__inner w-full">
                <WebDirectional items={[
                    { path: ROUTE_NAME.BRANDS, name: 'Thương hiệu' }
                ]} />
            </div>
            <div className="w-full my-4 p-4">
                <div className="cart-title text-center">TẤT CẢ THƯƠNG HIỆU</div>
                <div className="bran__list-line my-4"></div>
                <BrandList />
            </div>
        </div>
    );
};

export default BrandPage;
