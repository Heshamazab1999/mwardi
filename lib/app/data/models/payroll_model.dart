class PayrollModel {
  bool? status;
  String? message;
  List<Data>? data;

  PayrollModel({this.status, this.message, this.data});

  PayrollModel.fromJson(Map<String, dynamic> json) {
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
  int? employeeId;
  String? employeeCode;
  String? employeeName;
  String? jobTitle;
  int? workdays;
  String? salaryMonth;
  String? basicSalary;
  int? allowance;
  int? overtime;
  int? commission;
  int? otherPayment;
  int? totalDue;
  int? insurance;
  String? medicalInsurance;
  int? absent;
  int? absentS;
  int? loan;
  int? saturationDeduction;
  int? totalDeduction;
  int? netSalary;

  Data(
      {this.employeeId,
        this.employeeCode,
        this.employeeName,
        this.jobTitle,
        this.workdays,
        this.salaryMonth,
        this.basicSalary,
        this.allowance,
        this.overtime,
        this.commission,
        this.otherPayment,
        this.totalDue,
        this.insurance,
        this.medicalInsurance,
        this.absent,
        this.absentS,
        this.loan,
        this.saturationDeduction,
        this.totalDeduction,
        this.netSalary});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    employeeCode = json['employee_code'];
    employeeName = json['employee_name'];
    jobTitle = json['job_title'];
    workdays = json['workdays'];
    salaryMonth = json['salary_month'];
    basicSalary = json['basic_salary'];
    allowance = json['allowance'];
    overtime = json['overtime'];
    commission = json['commission'];
    otherPayment = json['other_payment'];
    totalDue = json['TotalDue'];
    insurance = json['insurance'];
    medicalInsurance = json['medical_insurance'];
    absent = json['absent'];
    absentS = json['absent_s'];
    loan = json['loan'];
    saturationDeduction = json['saturation_deduction'];
    totalDeduction = json['TotalDeduction'];
    netSalary = json['net_salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['employee_code'] = this.employeeCode;
    data['employee_name'] = this.employeeName;
    data['job_title'] = this.jobTitle;
    data['workdays'] = this.workdays;
    data['salary_month'] = this.salaryMonth;
    data['basic_salary'] = this.basicSalary;
    data['allowance'] = this.allowance;
    data['overtime'] = this.overtime;
    data['commission'] = this.commission;
    data['other_payment'] = this.otherPayment;
    data['TotalDue'] = this.totalDue;
    data['insurance'] = this.insurance;
    data['medical_insurance'] = this.medicalInsurance;
    data['absent'] = this.absent;
    data['absent_s'] = this.absentS;
    data['loan'] = this.loan;
    data['saturation_deduction'] = this.saturationDeduction;
    data['TotalDeduction'] = this.totalDeduction;
    data['net_salary'] = this.netSalary;
    return data;
  }
}
