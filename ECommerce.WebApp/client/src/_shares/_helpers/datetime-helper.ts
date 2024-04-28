export class DateTimeHelper {
  // inputDateTime: ex "2023-06-16T17:31:20.753" to "17:31, 16/06/2023" 
  // C# DateTime to js string
  public static getDateTimeFormated(inputDateTime: string): string {
    const dateTime = new Date(inputDateTime);
    // Create a function to add leading zeros to single-digit numbers
    const addLeadingZero = (num: number) => (num < 10 ? `0${num}` : num);
    // hh:mm
    const time = `${addLeadingZero(dateTime.getHours())}:${addLeadingZero(dateTime.getMinutes())}`;
    // dd/MM/yyyy
    const date = `${addLeadingZero(dateTime.getDate())}/${addLeadingZero(dateTime.getMonth() + 1)}/${dateTime.getFullYear()}`;

    const formattedDateTime = date + ' ' + time;
    return formattedDateTime;
  }
}
