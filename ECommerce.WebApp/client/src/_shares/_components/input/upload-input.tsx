import { forwardRef, useEffect, useImperativeHandle, useRef, useState } from "react";
import MuiIcon from "../mui-icon/mui-icon.component";
import { ICON_NAME } from "../mui-icon/_enums/mui-icon.enum";
import CommonService from "src/_cores/_services/common.service";
import { ENV } from "src/_configs/enviroment.config";
import { FormLabel, Grid, Menu, MenuItem } from "@mui/material";

interface IUploadProps extends React.HTMLProps<HTMLInputElement> {
    onChangeFiles: (e: any) => void,
    filesLimit?: number,
    selectedFiles?: string[],
    uploadType: "products" | "brand" | "rates"
    isRequired?: boolean,
}

const UploadInput = forwardRef((props: IUploadProps, ref: any) => {
    const {
        id,
        onChangeFiles,
        filesLimit = 3, // default limit: 3
        isRequired = false,
        uploadType,
        selectedFiles,
        ...rest
    } = props;

    const inputElement = useRef<any>(null);
    const [selectedFileNames, setSelectedFileNames] = useState<string[]>([]);
    const [delAnchorEl, setDelAnchorEl] = useState<null | HTMLElement>(null);
    const openDel = Boolean(delAnchorEl);

    useEffect(() => {
        if (selectedFiles && selectedFiles.length > 0) {
            setSelectedFileNames(selectedFiles.filter(_ => _));
        }
    }, [selectedFiles]);

    useImperativeHandle(ref, () => ({
        removeAllFiles() {
            handleRemoveFile('', true);
        }
    }));

    const handleOnChange = (e: { target: { files: any } }) => {
        const files = e.target.files;
        if (files.length > filesLimit) {
            return;
        }

        const upload = () => {
            const formData = new FormData();
            formData.append('uploadType', uploadType);
            for (const file of files) {
                formData.append('files', file)
            }
            CommonService.uploadFiles(formData).then((res: any) => {
                if (res.data) { // files name sent from server
                    const fileNames = selectedFileNames.concat(res.data);
                    setSelectedFileNames(fileNames);
                    onChangeFiles(fileNames);
                }
            }).catch((error: any) => {
                console.log(error);
            });
        }
        upload();
    };

    const handleRemoveFile = (_fileName: string, isRemoveAll: boolean = false) => {
        if (isRemoveAll && selectedFileNames.length === 0)
            return;
        const params = {
            fileNames: isRemoveAll ? selectedFileNames : [_fileName],
            uploadType: uploadType,
        }
        CommonService.removeFiles(params).then((res: any) => {
            if (res.isSucceed) {
                const updatedFileNames = selectedFileNames.filter((fileName) => fileName !== _fileName);
                setSelectedFileNames(updatedFileNames);
                onChangeFiles(updatedFileNames);
            }
        })
    };

    const handleRemoveFiles = (_fileNames: string[]) => {
        if (_fileNames.length === 0)
            return;

    };

    return (
        <Grid item xs={12} sm={12}>
            <div className="flex">
                <label htmlFor={id}>
                    <span className="upload mr-2 text-[#4e73df] cursor-pointer">Chọn ảnh</span>
                    <FormLabel>({isRequired && '*'}Tối đa {filesLimit}{!isRequired && ', nếu có'})</FormLabel>
                </label>
            </div>
            <input
                {...rest}
                id={id}
                type="file"
                ref={inputElement}
                onChange={handleOnChange}
            />
            {selectedFileNames.length > 0 && (
                <output className="images-uploaded flex mt-2">
                    {selectedFileNames.map((fileName) => (
                        <div className="image__upload-item" key={fileName}>
                            <div className="image-uploaded relative w-[100px] h-[100px] mr-[4px]">
                                <img
                                    src={`${ENV.IMAGE_URL}/${uploadType}/${fileName}`}
                                    alt="Ảnh của bạn"
                                    className="h-full w-full object-contain"
                                />
                                <span
                                    className="absolute top-0 right-0 cursor-pointer remove__upload"
                                    style={{
                                        backgroundColor: "#B22B27",
                                        borderRadius: "50%",
                                    }}
                                >
                                    <MuiIcon
                                        name={ICON_NAME.FEATHER.X}
                                        style={{
                                            stroke: "#FFFBF1",
                                            fontWeight: "900",
                                        }}
                                        className="feather feather-x"
                                        onClick={() => handleRemoveFile(fileName)}
                                    />
                                </span>
                            </div>
                        </div>
                    ))}
                </output>
            )}
        </Grid>
    );
})

export default UploadInput;