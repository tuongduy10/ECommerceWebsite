import { ERROR_MESSAGE } from '../_enums/message.enum';
import SessionService from '../_services/session.service';
const handleError = (error: any) => {
  if (error.response) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx
    switch(error.response.satus) {
      case 400:
        alert("lỗi")
        return;
      case 401: 
        SessionService.deleteAccessToken();
        window.location.href = '/login';
        return;
      case 403: 
        window.location.href = '/access-denied';
        return;
      case 404: 
        window.location.href = '/not-found';
        return;
      case 500: 
        alert(ERROR_MESSAGE.STH_WENT_WRONG);
        return;
      default: 
        return error.message;
    }
  }
};

export default handleError;
