import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mwardi/app/common/constants/app_constants.dart';
import 'package:mwardi/app/data/managers/cache_manager/cache_manager.dart';
import 'package:mwardi/app/data/models/login_response/login_response.dart';
import 'package:mwardi/app/data/models/login_response/data.dart' as EMPLOYEE;
import 'package:mwardi/app/data/services/http/http_lib.dart';
import 'package:mwardi/app/util/action_center/exceptions.dart';

import '../../../common/app_urls.dart';
import '../../../routes/app_pages.dart';
import '../../services/cache/cache.dart';
import '../cache_manager/cache_manager.dart';

class AuthManager {
  final IHttpService _httpService;

  // final CacheManager cacheManager;
  AuthManager(this._httpService);

  String get baseUrl => '$domainURL$apiPath$apiVersion$employeePath';
  var cacheHelper = Get.find<AbsCacheService>();

  Future<LoginResponse?> login(
      {required String loginId,
      required String password,
      required String deviceId,
      required String fcmToken}) async {
    var request = HttpRequest(
      method: HttpMethod.post,
      url: "$baseUrl/login",
      jsonData: {
        'login_id': loginId,
        'password': password,
        'device_id': deviceId,
        'fcm_token': fcmToken,
      },
    );
    var response = await _httpService.sendRequest(request);

    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"]) {
        cacheHelper.storeString('token', data['data']['token']);
        print(
            '*************************${cacheHelper.retrieveString('token')}************');
        return LoginResponse.fromMap(data as Map<String, dynamic>);
      } else {
        throw CustomException(jsonEncode(data['message']));
      }
    } else {
      throw response.statusMessage!;
    }
  }

  Future<bool?> updatePassword({
    required String oldPass,
    required String newPass,
    required String confirmedPAss,
  }) async {
    var request = HttpRequest(
      method: HttpMethod.post,
      url: "$baseUrl/reset_password",
      jsonData: {
        'old_password': oldPass,
        'password': newPass,
        'password confirmation': confirmedPAss,
      },
    );
    request.addAuthBearerHeader(Get.find<ICacheManager>().getToken() ?? "");

    var response = await _httpService.sendRequest(request);
    //
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"].toString() == 'true') {
        return true;
      } else {
        throw CustomException(jsonEncode(data['message']));
      }
    } else {
      throw response.statusMessage!;
    }
  }

  Future<EMPLOYEE.Data?> updateProfilePic({
    required File newProfilePic,
  }) async {
    var request = MediaHttpRequest(
        method: HttpMethod.postWithMedia,
        url: "$baseUrl/update_picture",
        jsonData: {},
        files: {'profile': newProfilePic});

    request.addAuthBearerHeader(Get.find<ICacheManager>().getToken() ?? "");

    var response = await _httpService.sendRequest(request);
    //
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"].toString() == 'true') {
        return EMPLOYEE.Data.fromMap(data["data"]);
      } else {
        throw CustomException(jsonEncode(data['message']));
      }
    } else {
      throw response.statusMessage!;
    }
  }

  logOut() async {
    var request = HttpRequest(
      method: HttpMethod.post,
      url: "$baseUrl/logout",
    );
    request.addAuthBearerHeader(Get.find<ICacheManager>().getToken() ?? "");
    var response = await _httpService.sendRequest(request);
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"]) {
         await Get.find<ICacheManager>().clearUserData();
         await Get.find<ICacheManager>().clearAllData();
         print(response);
      }
    }
  }
  sendOtp({required String email}) async {
    //forgetpassword
    var request = HttpRequest(
      method: HttpMethod.post,
      url: "${ConstantsURL.baseURL}${ConstantsURL.forgetpasswordURl}",
      jsonData: {
        'email': email,
      },
    );
     var response = await _httpService.sendRequest(request);
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"]) {
        print(data['data']['code']);

         print(response.data);
      }
    }
  }
  verifyOtp({
    required dynamic code,
    required String email,
  }) async {

    var request = HttpRequest(
      method: HttpMethod.post,
      url: "${ConstantsURL.baseURL}${ConstantsURL.otpURl}",
      jsonData: {
        'email': email,
        'code':code
      },
    );
    var response = await _httpService.sendRequest(request);
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"]) {
        print(data['data']['code']);

        print(response);
      }
    }
  }


  rechangePassword({ required dynamic password,
    required String email,})async{

    var request = HttpRequest(
      method: HttpMethod.post,
      url: "${ConstantsURL.baseURL}${ConstantsURL.rechangeURl}",
      jsonData: {
        'email': email,
        'password':password
      },
    );
    var response = await _httpService.sendRequest(request);
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      Map data = jsonDecode(response.data ?? "");
      if (data["status"]) {
        cacheHelper.storeString('token', data['data']['token']);
        print(
            '*************************${cacheHelper.retrieveString('token')}************');
        return LoginResponse.fromMap(data as Map<String, dynamic>);
      } else {
        throw CustomException(jsonEncode(data['message']));
      }
    }
  }
}
