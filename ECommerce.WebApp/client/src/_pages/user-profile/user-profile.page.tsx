import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { ICity, IDistrict, IWard } from "src/_cores/_interfaces";
import { showSuccess } from "src/_cores/_reducers/alert.reducer";
import { refreshUserData } from "src/_cores/_reducers/auth.reducer";
import CommonService from "src/_cores/_services/common.service";
import UserService from "src/_cores/_services/user.service";
import { useAuthStore, useUserStore } from "src/_cores/_store/root-store";
import { MuiIcon } from "src/_shares/_components";
import { ICON_NAME } from "src/_shares/_components/mui-icon/_enums/mui-icon.enum";

const UserProfilePage = () => {
    const [cities, setCitites] = useState<ICity[]>([]);
    const [districts, setDistricts] = useState<IDistrict[]>([]);
    const [wards, setWards] = useState<IWard[]>([]);
    const [dataDetail, setDataDetail] = useState<{ [key: string]: any }>({});
    const userStore = useUserStore();
    const authStore = useAuthStore();
    const dispatch = useDispatch();


    useEffect(() => {
        getCities();
        getUserInfo();
    }, []);

    const getUserInfo = async () => {
        const result = await UserService.getUserInfo() as any;
        if (result) {
            setDataDetail(result);
            dispatch(refreshUserData(result));
            if (result.cityCode) {
                getDistricts(result.cityCode);
            }
            if (result.wardCode) {
                getWards(result.districtCode);
            }
        }
    }

    const getCities = () => {
        CommonService.getCities().then(res => {
            setCitites(res.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const onChangeCity = (code: string) => {
        const _dataDetail = {
            ...dataDetail,
            cityCode: code,
            districtCode: '',
            wardCode: ''
        }
        setDataDetail(_dataDetail);
        getDistricts(code);
    }

    const getDistricts = (code: string) => {
        CommonService.getDistrictsByCityCode(code).then(res => {
            setDistricts(res.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const onChangeDistrict = (code: string) => {
        const _dataDetail = {
            ...dataDetail,
            districtCode: code,
            wardCode: ''
        }
        setDataDetail(_dataDetail);
        getWards(code);
    }

    const getWards = (code: string) => {
        CommonService.getWardsByDistrictCode(code).then(res => {
            setWards(res.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const onChangeWard = (code: string) => {
        onChangeFieldValue('wardCode', code);
    }

    const onChangeFieldValue = (field: string, value: any) => {
        setDataDetail({ ...dataDetail, [field]: value });
    }

    const update = async () => {
        const _param = {
            ...dataDetail,
            email: dataDetail['mail']
        }
        const res = await UserService.updateUser(_param) as any;
        if (res.isSucceed) {
            dispatch(showSuccess("Cập nhật thành công"));
        }
    }

    return (
        <div className="tab-content">
            <div className="text-center">
                <div className="title"><strong>THÔNG TIN CÁ NHÂN</strong></div>
            </div>
            <div className="user__info-form mx-auto">
                <div className="form-basic">
                    <label>Họ tên</label>
                    <input type="text" className="w-full" value={dataDetail ? dataDetail['fullName'] : ""} onChange={(e) => onChangeFieldValue('fullName', e.target.value)} />
                </div>
                <div className="form-basic">
                    <label>Số điện thoại</label>
                    <div className="flex items-center">
                        <input type="tel" className="mr-2 w-full" value={dataDetail ? dataDetail['phone'] : ""} onChange={(e) => onChangeFieldValue('phone', e.target.value)} />
                    </div>
                </div>
                <div className="form-basic">
                    <label>Email</label>
                    <input type="text" className="w-full" value={dataDetail ? dataDetail['mail'] : ""} onChange={(e) => onChangeFieldValue('mail', e.target.value)} />
                </div>
                <div className="form-basic">
                    <label>Địa chỉ</label>
                    <input type="text" className="w-full mb-2" value={dataDetail ? dataDetail['address'] : ""} onChange={(e) => onChangeFieldValue('address', e.target.value)}/>
                    <div className="flex flex-wrap">
                        <div className="select-form w-full mb-2">
                            <select className="w-full" onChange={e => onChangeCity(e.target.value)}>
                                <option value="" disabled selected={!dataDetail || !dataDetail['cityCode']}>Tỉnh/Thành...</option>
                                {cities.length > 0 && (
                                    cities.map((city) => (
                                        <option key={city.code} value={city.code} selected={city.code === (dataDetail ? dataDetail['cityCode'] : "")}>{city.name}</option>
                                    ))
                                )}
                            </select>
                            <span className="flex items-center">
                                <MuiIcon name={ICON_NAME.FEATHER.CHEVRON_DOWN} />
                            </span>
                        </div>
                        <div className="select-form w-full mb-2">
                            <select className="user-district w-full" onChange={e => onChangeDistrict(e.target.value)}>
                                <option value="" disabled selected={!dataDetail || !dataDetail['districtCode']}>Quận/Huyện...</option>
                                {districts.length > 0 && (
                                    districts.map((item) => (
                                        <option key={item.code} value={item.code} selected={item.code === (dataDetail ? dataDetail['districtCode'] : "")}>{item.name}</option>
                                    ))
                                )}
                            </select>
                            <span className="flex items-center">
                                <MuiIcon name={ICON_NAME.FEATHER.CHEVRON_DOWN} />
                            </span>
                        </div>
                        <div className="select-form w-full mb-2">
                            <select className="user-ward w-full" onChange={e => onChangeWard(e.target.value)}>
                                <option value="" disabled selected={!dataDetail || !dataDetail['wardCode']}>Phường/Xã...</option>
                                {wards.length > 0 && (
                                    wards.map((item) => (
                                        <option key={item.code} value={item.code} selected={item.code === (dataDetail ? dataDetail['wardCode'] : "")}>{item.name}</option>
                                    ))
                                )}
                            </select>
                            <span className="flex items-center">
                                <MuiIcon name={ICON_NAME.FEATHER.CHEVRON_DOWN} />
                            </span>
                        </div>
                    </div>
                </div>
                <div className="text-right">
                    <button className="update-userprofile btn-black" onClick={update}>Cập nhật</button>
                </div>
            </div>
        </div>
    )
}

export default UserProfilePage;