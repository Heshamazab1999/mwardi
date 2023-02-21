import 'dart:convert';

import 'package:get/get.dart';
import 'package:mwardi/app/common/constants/app_constants.dart';
import 'package:mwardi/app/data/models/login_response/login_response.dart';
import 'package:mwardi/app/data/services/http/http_lib.dart';
import 'package:mwardi/app/util/action_center/exceptions.dart';

import '../../../common/app_urls.dart';
import '../../../routes/app_pages.dart';
import '../../models/attendance_model.dart';
import '../../services/cache/cache.dart';
import '../cache_manager/cache_manager.dart';

class AttendanceManager {
  final IHttpService _httpService;

   AttendanceManager(this._httpService);


  Future<AttendanceModel?> getAttendance() async {
    var request = HttpRequest(
      method: HttpMethod.get,
       url: "${ConstantsURL.baseURL}${ConstantsURL.attendanceURL}",

    );


    var response = await _httpService.sendRequest(request);
    request.addAuthBearerHeader(Get.find<ICacheManager>().getToken() ?? "");

    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"]) {
         print(data['data'][0]);
         return AttendanceModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw CustomException(jsonEncode(data['errors']));
      }
    } else {
      throw response.statusMessage!;
    }
  }

 }
