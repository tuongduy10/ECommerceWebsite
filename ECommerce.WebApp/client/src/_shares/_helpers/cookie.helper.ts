import Cookies from 'js-cookie';

export default class CookieHelper {
  public static setCookie(name: string, value: string, exp: number = 0) {
    Cookies.set(name, value, { expires: 4 / 24, secure: true});
  }
  public static getCookie(name: string): string {
    return Cookies.get(name) || '';
  }
  public static deleteCookie(name: string) {
    Cookies.remove(name);
  }
}
