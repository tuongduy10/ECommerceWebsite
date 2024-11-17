import { IPagedRequest } from "src/_cores/_interfaces";

export interface IOrderPagedRequest extends IPagedRequest {
    status: string;
    phoneNumber: string;
}