class AttendanceModel {
  bool? status;
  String? message;
  List<Data>? data;

  AttendanceModel({this.status, this.message, this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  int? activityStatus;
  String? title;
  String? timeIn;
  String? timeOut;
  String? description;

  Data(
      {this.date,
        this.activityStatus,
        this.title,
        this.timeIn,
        this.timeOut,
        this.description});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    activityStatus = json['activity_status'];
    title = json['title'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['activity_status'] = this.activityStatus;
    data['title'] = this.title;
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    data['description'] = this.description;
    return data;
  }
}
