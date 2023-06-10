class BookingSetting {
  final int status;
  final bool success;
  final Data? data;

  BookingSetting({
    required this.status,
    required this.success,
    required this.data,
  });

  factory BookingSetting.fromJson(Map<String, dynamic> json){
    return BookingSetting(
    status : json['status'],
    success : json['success'],
    data : json['data'] == null ? null : Data.fromJson(json['data']),
    );
  }
}

class Data {
  Data({
    required this.confirmAuto,
    required this.bookingWindow,
    required this.futureBooking,
    required this.rescheduling,
  });
  final bool confirmAuto;
  final String bookingWindow;
  final String futureBooking;
  final String rescheduling;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
    confirmAuto : json['confirmAuto'] ?? false,
    bookingWindow : json['bookingWindow'] ?? "",
    futureBooking : json['futureBooking'] ?? "",
    rescheduling : json['rescheduling'] ?? "",
    );
  }
}