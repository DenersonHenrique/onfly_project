
import 'package:equatable/equatable.dart';

import 'http_status.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(String url, {Map<String, String>? headers});

  Future<HttpResponse> post(String url, {Map<String, String>? headers, Map<String, dynamic>? body});

  Future<HttpResponse> put(String url, {Map<String, String>? headers, Map<String, dynamic>? body});

  Future<HttpResponse> patch(String url, {Map<String, String>? headers, Map<String, dynamic>? body});

  Future<HttpResponse> delete(String url, {Map<String, String>? headers, Map<String, dynamic>? body});
}

enum HttpMethod { delete, get, put, post, patch }

class HttpResponse extends Equatable {
  final HttpStatus status;

  final dynamic data;

  const HttpResponse({
    required this.status,
    this.data,
  });

  factory HttpResponse.success(
    Object? data, {
    HttpStatus status = HttpStatus.ok,
  }) {
    return HttpResponse(status: status, data: data);
  }

  factory HttpResponse.empty({HttpStatus status = HttpStatus.noContent}) {
    return HttpResponse(status: status);
  }

  @override
  List<Object?> get props => [status, data];
}