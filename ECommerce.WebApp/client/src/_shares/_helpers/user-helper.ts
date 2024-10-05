export class UserHelper {
  public static userIsActived(isActived: boolean) {
    if (isActived === true) {
      return { label: "Đã xác thực", color: "#1cc88a" };
    }
    return { label: "Đang xác thực", color: "yellow" };
  }
  public static getUserAddress(user: any) {
    let address = user.userAddress ?? "";
    if (user.userWardName) {
      address += `, ${user.userWardName}`;
    }
    if (user.userDistrictName) {
      address += `, ${user.userDistrictName}`;
    }
    if (user.userCityName) {
      address += `, ${user.userCityName}`;
    }
    return address;
  }
}
