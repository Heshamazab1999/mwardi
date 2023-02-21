import 'package:mwardi/app/data/services/http/http_lib.dart';

abstract class IHttpService {
  Future<HttpResponse?> sendRequest(HttpRequest request);
}
