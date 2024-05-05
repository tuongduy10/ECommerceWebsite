import { Chip } from "@mui/material"
import { FormatHelper } from "src/_shares/_helpers/format-helper"

const StatusDisplay = (props: any) => {
    const statusCode = props.statusCode;
    const statusObj = FormatHelper.getOrderStatus(statusCode);
    return (
        <Chip
            label={statusObj?.name}
            style={{ 
                backgroundColor: statusObj?.backgroud,
                color: statusObj?.color || '',
                border: 'unset'
            }}
            variant="outlined"
        />
    )
}

export default StatusDisplay;