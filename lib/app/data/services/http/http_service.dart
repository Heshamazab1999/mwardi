import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mwardi/app/util/action_center/exceptions.dart';
import 'package:mwardi/app/data/services/logger/logger.dart';
import 'package:mwardi/app/util/serialization/serialization_lib.dart';
import 'package:mime/mime.dart';
import 'package:http/retry.dart';
import 'http_lib.dart';
import 'package:http_parser/http_parser.dart';

/// an implementation of the http service using dio
class HttpService extends GetxService implements IHttpService {
  final AbsLogger _logger;
  final bool isTesting;

  HttpService(this._logger, {this.isTesting = false});

  String getLocale() {
    String locale = Localizations.localeOf(Get.context!).languageCode;
    return locale;
  }

  @override
  Future<HttpResponse?> sendRequest(HttpRequest request) async {
    late http.Response response;

    var uri = Uri.parse(request.url);

    // appVersion and locale headers

    // log
    _logger.writeLog(
        LogLevel.info,
        'Api Request method: ${_methodName(request.method)} ,url: ${request.url}',
        request.data);

    switch (request.method) {
      case HttpMethod.get:
        response = (await _getData(request, uri))!;
        break;

      case HttpMethod.post:
        response = (await _postData(request, uri))!;
        break;

      case HttpMethod.putWithMedia:
        response = (await _putDataWithMedia(request as MediaHttpRequest, uri))!;
        break;

      case HttpMethod.postWithMedia:
        response =
            (await _postDataWithMedia(request as MediaHttpRequest, uri))!;
        break;

      case HttpMethod.patch:
        response = (await _patchData(request, uri))!;
        break;

      case HttpMethod.put:
        response = (await _putData(request, uri))!;
        break;

      case HttpMethod.delete:
        response = (await _deleteData(request, uri))!;
        break;
    }
    _logger.info(message: response.statusCode.toString());
    if (response.statusCode < 200 || response.statusCode > 299) {
      _logger.error(
          error:
              'Api Error Response (${response.statusCode}) method: ${_methodName(request.method)} ,url: ${request.url},\r data: ${response.body}');
      if (!isTesting) _throwResponseError(response);
      return null;
    }

    // log response
    _logger.writeLog(
        LogLevel.info,
        'Api Response method: ${_methodName(request.method)} ,url: ${request.url}',
        _serialize(response.body));

    return _fillResponse(response);
  }

  Future<http.Response?> _getData(HttpRequest request, Uri uri) async {
    final client = RetryClient(http.Client());
    try {
      var response = await client.get(uri, headers: request.headers);
      return response;
    } catch (err) {
      _throwOtherError(err);
    } finally {
      client.close();
    }
    return null;
  }

  Future<http.Response?> _postData(HttpRequest request, Uri uri) async {
    final client = RetryClient(http.Client());
    try {
      var response = await client.post(uri,
          headers: request.headers,
          body: request.jsonData ?? _serialize(request.data));
      return response;
    } catch (err) {
      _throwOtherError(err);
    } finally {
      client.close();
    }
    return null;
  }

  Future<http.Response?> _putData(HttpRequest request, Uri uri) async {
    final client = RetryClient(http.Client());
    try {
      var response = await client.put(uri,
          headers: request.headers,
          body: request.jsonData ?? _serialize(request.data));
      return response;
    } catch (err) {
      _throwOtherError(err);
    } finally {
      client.close();
    }
    return null;
  }

  Future<http.Response?> _putDataWithMedia(
      MediaHttpRequest request, Uri uri) async {
    var multipartRequest = http.MultipartRequest('PUT', uri);
    try {
      multipartRequest.fields.addAll(request.jsonData!);
      request.files?.forEach((key, value) async {
        multipartRequest.files
            .add(await http.MultipartFile.fromPath(key, value.path));
      });
      multipartRequest.headers.addAll(request.headers!);

      log("headers: ${multipartRequest.headers}\nfields: ${multipartRequest.fields}\nfile name: ${multipartRequest.files.toString()}");

      http.StreamedResponse streamedResponse = await multipartRequest.send();
      var response = await http.Response.fromStream(streamedResponse);
      log("Response: (${response.statusCode}) ");
      return response;
    } catch (err) {
      log(err.toString());
      _throwOtherError(err);
    }
    return null;
  }

  Future<http.Response?> _postDataWithMedia(
      MediaHttpRequest request, Uri uri) async {
    var multipartRequest = http.MultipartRequest('POST', uri);
    try {
      multipartRequest.fields.addAll(request.jsonData!);
      if (request.files != null && request.files!.isNotEmpty) {
        for (var pair in request.files!.entries) {
          multipartRequest.files.add(
            await http.MultipartFile.fromPath(pair.key, pair.value.path,
                contentType: MediaType(
                    lookupMimeType(pair.value.path)!.split('/').first,
                    lookupMimeType(pair.value.path)!.split('/').last)),
          );
        }
      }
      request.headers!['Content-Type'] = 'multipart/form-data';
      multipartRequest.headers.addAll(request.headers!);

      log("headers: ${multipartRequest.headers}\nfields: ${multipartRequest.fields}\nfields: ${multipartRequest.files.join(", ")}");

      http.StreamedResponse streamedResponse = await multipartRequest.send();
      var response = await http.Response.fromStream(streamedResponse);
      log("Response: (${response.statusCode}) ");
      return response;
    } catch (err) {
      _throwOtherError(err);
    }
    return null;
  }

  Future<http.Response?> _patchData(HttpRequest request, Uri uri) async {
    final client = RetryClient(http.Client());
    try {
      var response = await client.patch(uri,
          headers: request.headers,
          body: request.jsonData ?? _serialize(request.data));
      return response;
    } catch (err) {
      _throwOtherError(err);
    } finally {
      client.close();
    }
    return null;
  }

  Future<http.Response?> _deleteData(HttpRequest request, Uri uri) async {
    final client = RetryClient(http.Client());
    try {
      var response = await client.delete(uri,
          headers: request.headers,
          body: request.jsonData ?? _serialize(request.data));
      return response;
    } catch (err, st) {
      _logger.error(error: err, stackTrace: st);
      _throwOtherError(err);
    } finally {
      client.close();
    }
    return null;
  }

  HttpResponse _fillResponse(http.Response response) {
    return HttpResponse(statusCode: response.statusCode, data: response.body);
  }

  @override
  Future<HttpResponse?> sendAuthenticatedRequest(
      HttpRequest<Serializable> request) {
    // TODO: implement sendAuthenticatedRequest
    throw UnimplementedError();
  }

  String _serialize(Object? data) {
    if (data == null) return 'null';
    if (data is Serializable) return data.serialize();
    if (data is List<Serializable>) return JsonSerializer().serializeList(data);
    return data.toString();
  }

  String _methodName(HttpMethod m) {
    return m == HttpMethod.get
        ? "GET"
        : m == HttpMethod.post
            ? "POST"
            : m == HttpMethod.putWithMedia
                ? "PUT MULTIPARTFILE"
                : m == HttpMethod.put
                    ? "PUT"
                    : m == HttpMethod.patch
                        ? "PATCH"
                        : m == HttpMethod.postWithMedia
                            ? "POST"
                            : "DELETE";
  }

  void _throwResponseError(http.Response? response) {
    throw ApiResponseException(response?.statusCode ?? 0)
      ..message = response?.body ?? ""
      ..originalException = response?.reasonPhrase;
  }

  void _throwTimeOut(Object error) {
    throw ApiTimeoutException()..originalException = error;
  }

  void _throwOtherError(Object error) {
    throw CustomException(error.toString())..originalException = error;
  }
}
