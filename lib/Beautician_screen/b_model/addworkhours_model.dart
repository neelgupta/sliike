

class AddWorkModel {
  List<DayDetails>? dayDetails;

  AddWorkModel({this.dayDetails});

  AddWorkModel.fromJson(Map<String, dynamic> json) {
    if (json['dayDetails'] != null) {
      dayDetails = <DayDetails>[];
      json['dayDetails'].forEach((v) {
        dayDetails!.add(DayDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dayDetails != null) {
      data['dayDetails'] = dayDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayDetails {
  String? day;
  String? startTime;
  String? endTime;
  String? breakStartTime;
  String? breakEndTime;
  bool? isOpen;

  DayDetails(
      {this.day,
        this.startTime,
        this.endTime,
        this.breakStartTime,
        this.breakEndTime,
        this.isOpen});

  DayDetails.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    breakStartTime = json['breakStartTime'];
    breakEndTime = json['breakEndTime'];
    isOpen = json['isOpen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['breakStartTime'] = breakStartTime;
    data['breakEndTime'] = breakEndTime;
    data['isOpen'] = isOpen;
    return data;
  }
}