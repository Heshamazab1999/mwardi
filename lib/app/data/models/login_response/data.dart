import 'dart:convert';

import 'employee.dart';

class Data {
  Employee? employee;
  List<dynamic>? weekVacations;
  String? companyStartTime;
  String? companyEndTime;
  dynamic slate;
  String? token;

  Data({
    this.employee,
    this.weekVacations,
    this.companyStartTime,
    this.companyEndTime,
    this.slate,
    this.token,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        employee: data['employee'] == null
            ? null
            : Employee.fromMap(data['employee'] as Map<String, dynamic>),
        weekVacations: data['week_vacations'] as List<dynamic>?,
        companyStartTime: data['company_start_time'] as String?,
        companyEndTime: data['company_end_time'] as String?,
        slate: data['slate'] as dynamic,
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'employee': employee?.toMap(),
        'week_vacations': weekVacations,
        'company_start_time': companyStartTime,
        'company_end_time': companyEndTime,
        'slate': slate,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    Employee? employee,
    List<String>? weekVacations,
    String? companyStartTime,
    String? companyEndTime,
    dynamic slate,
    String? token,
  }) {
    return Data(
      employee: employee ?? this.employee,
      weekVacations: weekVacations ?? this.weekVacations,
      companyStartTime: companyStartTime ?? this.companyStartTime,
      companyEndTime: companyEndTime ?? this.companyEndTime,
      slate: slate ?? this.slate,
      token: token ?? this.token,
    );
  }
}
