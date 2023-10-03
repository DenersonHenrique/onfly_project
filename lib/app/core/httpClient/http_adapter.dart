import 'package:dio/dio.dart';

import 'http_status.dart';
import './http_client.dart';
import 'http_interceptor.dart';

class HttpAdapter implements IHttpClient {
  final Dio client;

  HttpAdapter({required this.client});

  static const Map<String, dynamic> _defaultHeaders = {};

  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) {
    return request(
        method: HttpMethod.delete, url: url, body: body, headers: headers);
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) {
    return request(method: HttpMethod.get, url: url, headers: headers);
  }

  @override
  Future<HttpResponse> patch(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) {
    return request(
        method: HttpMethod.patch, url: url, body: body, headers: headers);
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) {
    return request(
        method: HttpMethod.post, url: url, body: body, headers: headers);
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) {
    return request(
        method: HttpMethod.put, url: url, body: body, headers: headers);
  }

  Future<HttpResponse> request({
    required String url,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Response response;

    client.options.headers = _defaultHeaders;
    client.options.connectTimeout = const Duration(milliseconds: 10000);
    client.options.receiveTimeout = const Duration(milliseconds: 8000);

    try {
      switch (method) {
        case HttpMethod.delete:
          response = await client.delete(
            url,
            options: _setDefaultHeaders(headers),
          );
        case HttpMethod.get:
          response = await client.get(
            url,
            data: body,
            options: _setDefaultHeaders(headers),
          );
        case HttpMethod.post:
          response = await client.post(
            url,
            data: body,
            options: _setDefaultHeaders(headers),
          );
          response;
        case HttpMethod.patch:
          response = await client.patch(
            url,
            data: body,
            options: _setDefaultHeaders(headers),
          );
        case HttpMethod.put:
          response = await client.put(
            url,
            data: body,
            options: _setDefaultHeaders(headers),
          );
      }
    } on DioException catch (error) {
      if (error.response == null) {
        throw const BadRequestException(
          status: HttpStatus.badRequest,
        );
      }
      return await _handleResponse(error.response!);
    }
    return await _handleResponse(response);
  }

  Future<HttpResponse> handleData(
    Response response,
    HttpStatus status,
  ) async {
    final responseData = await response.data;
    if (responseData == null) {
      return HttpResponse.empty(status: status);
    }
    return HttpResponse.success(responseData, status: status);
  }

  Options _setDefaultHeaders(Map<String, String>? headers) {
    return Options(headers: Map.from(_defaultHeaders)..addAll(headers ?? {}));
  }

  _handleResponse(Response response) async {
    final statusCode = HttpStatus.values
        .firstWhere((status) => status.code == response.statusCode);
    if (statusCode.code.between(200, 299)) {
      switch (statusCode) {
        case HttpStatus.ok:
          return HttpResponse.success(response.data, status: statusCode);
        case HttpStatus.created:
          return HttpResponse.success(response.data, status: statusCode);
        //  return await _handleData(response.data, statusCode);
        case HttpStatus.accepted:
          return HttpResponse.empty(status: statusCode);
        default:
          return HttpResponse.empty();
      }
    } else if (statusCode.code.between(400, 499)) {
      if (statusCode == HttpStatus.unauthorized) {
        throw UnauthorizedException(
            message: response.data['erro']['mensagem'], data: response.data);
      }

      throw BadRequestException(
        status: statusCode,
        data: response.data,
      );
    } else {
      throw ServerErrorException(message: response.data['erro']['mensagem']);
    }
  }
}

extension StatusCodeExtension on int {
  bool between(int min, int max) {
    return this >= min && this <= max;
  }
}
