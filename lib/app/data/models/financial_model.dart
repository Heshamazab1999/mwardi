class FinancialModel {
  bool? status;
  String? message;
  Data? data;

  FinancialModel({this.status, this.message, this.data});

  FinancialModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? employeeSalary;
  String? paymentType;
  Null? insuranceNumber;
  Null? policyNumber;
  Null? insuranceStartdate;
  Null? cost;

  Data(
      {this.employeeSalary,
        this.paymentType,
        this.insuranceNumber,
        this.policyNumber,
        this.insuranceStartdate,
        this.cost});

  Data.fromJson(Map<String, dynamic> json) {
    employeeSalary = json['employee_salary'];
    paymentType = json['payment_type'];
    insuranceNumber = json['insurance_number'];
    policyNumber = json['policy_number'];
    insuranceStartdate = json['insurance_startdate'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_salary'] = this.employeeSalary;
    data['payment_type'] = this.paymentType;
    data['insurance_number'] = this.insuranceNumber;
    data['policy_number'] = this.policyNumber;
    data['insurance_startdate'] = this.insuranceStartdate;
    data['cost'] = this.cost;
    return data;
  }
}
