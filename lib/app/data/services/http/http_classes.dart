import 'dart:io';

enum HttpMethod { get, post, put, patch, delete, putWithMedia, postWithMedia }

class HttpRequest<T> {
  String url;
  Map<String, String>? headers;
  HttpMethod method;
  T? data;
  String? jsonPatchData;
  Map<String, String>? jsonData;
  String? mediaPath;

  HttpRequest({
    required this.method,
    required this.url,
    this.headers,
    this.data,
    this.jsonData,
    this.mediaPath,
  });

  void addAuthBearerHeader(String bearer) {
    headers ??= {};
    //
    headers!["Authorization"] = "Bearer $bearer";
  }

  void addAppVersionHeader(String version) {
    headers ??= {};
    //
    headers!["x-app-version"] = version;
  }

  void addUserLocaleHeader(String locale) {
    headers ??= {};
    //
    headers!["x-app-locale"] = locale;
  }

  void addJsonHeaders() {
    headers ??= {};
    //
    headers!["Accept"] = "application/json";
    headers!["Content-Type"] = "application/json";
  }

  void addUrlEncodedHeader() {
    headers ??= {};
    //
    headers!["Content-Type"] = "application/x-www-form-urlencoded";
  }

  void addCustomHeaders() {
    headers ??= {};
    //
    // this.headers!["X-App-Type"] = "buyer";
  }

  void addAppTypeHeaders(String type) {
    headers ??= {};
    //
    headers!["X-App-Type"] = type;
  }

  void addUserIDHeaders(String id) {
    headers ??= {};
    //
    headers!["X-App-User-Id"] = id;
  }
}

class MediaHttpRequest<T> extends HttpRequest<T> {
  final Map<String, File>? files;
  MediaHttpRequest({
    required HttpMethod method,
    required String url,
    Map<String, String>? headers,
    Map<String, String>? jsonData,
    this.files,
  }) : super(
          method: method,
          url: url,
          headers: headers,
          jsonData: jsonData,
        );
}

class HttpResponse {
  int? statusCode;
  String? statusMessage;
  String? data;

  HttpResponse({this.statusCode, this.statusMessage, this.data});
}
