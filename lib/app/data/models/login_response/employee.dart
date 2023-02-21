import 'dart:convert';

class Employee {
  String? name;
  String? type;
  String? job;
  String? profile;

  Employee({this.name, this.type, this.job, this.profile});

  factory Employee.fromMap(Map<String, dynamic> data) => Employee(
        name: data['name'] as String?,
        type: data['type'] as String?,
        job: data['job'] as String?,
        profile: data['profile'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type,
        'job': job,
        'profile': profile,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Employee].
  factory Employee.fromJson(String data) {
    return Employee.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Employee] to a JSON string.
  String toJson() => json.encode(toMap());

  Employee copyWith({
    String? name,
    String? type,
    String? job,
    String? profile,
  }) {
    return Employee(
      name: name ?? this.name,
      type: type ?? this.type,
      job: job ?? this.job,
      profile: profile ?? this.profile,
    );
  }
}
