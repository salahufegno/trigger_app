import 'dart:convert';
import 'package:flutter/foundation.dart';

/// Represents an API endpoint configuration
@immutable
class ApiModel {
  /// Creates a new instance of [ApiModel]
  const ApiModel({
    required this.apiName,
    required this.endpointUri,
    required this.requestMethod,
    required this.queryParams,
    required this.requestHeaders,
    required this.requestBody,
  });
  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      apiName: map['apiName'] as String,
      endpointUri: map['endpointUri'] as String,
      requestMethod: ApiMethod.values.byName(map['requestMethod'] as String),
      queryParams: Map<String, dynamic>.from(map['queryParams'] as Map),
      requestHeaders: Map<String, dynamic>.from(map['requestHeaders'] as Map),
      requestBody: Map<String, dynamic>.from(map['requestBody'] as Map),
    );
  }

  factory ApiModel.fromJson(String source) => ApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  /// The name of the API endpoint
  final String apiName;

  /// The URI of the endpoint
  final String endpointUri;

  /// The HTTP method for the request
  final ApiMethod requestMethod;

  /// The query parameters
  final Map<String, dynamic> queryParams;

  /// The HTTP headers
  final Map<String, dynamic> requestHeaders;

  /// The request body data
  final Map<String, dynamic> requestBody;

  ApiModel copyWith({
    String? apiName,
    String? endpointUri,
    ApiMethod? requestMethod,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? requestHeaders,
    Map<String, dynamic>? requestBody,
  }) {
    return ApiModel(
      apiName: apiName ?? this.apiName,
      endpointUri: endpointUri ?? this.endpointUri,
      requestMethod: requestMethod ?? this.requestMethod,
      queryParams: queryParams ?? this.queryParams,
      requestHeaders: requestHeaders ?? this.requestHeaders,
      requestBody: requestBody ?? this.requestBody,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'apiName': apiName,
      'endpointUri': endpointUri,
      'requestMethod': requestMethod.name,
      'queryParams': queryParams,
      'requestHeaders': requestHeaders,
      'requestBody': requestBody,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ApiModel(apiName: $apiName, endpointUri: $endpointUri, requestMethod: $requestMethod, queryParams: $queryParams, requestHeaders: $requestHeaders, requestBody: $requestBody)';
  }

  @override
  bool operator ==(covariant ApiModel other) {
    if (identical(this, other)) return true;

    return other.apiName == apiName &&
        other.endpointUri == endpointUri &&
        other.requestMethod == requestMethod &&
        mapEquals(other.queryParams, queryParams) &&
        mapEquals(other.requestHeaders, requestHeaders) &&
        mapEquals(other.requestBody, requestBody);
  }

  @override
  int get hashCode {
    return apiName.hashCode ^ endpointUri.hashCode ^ requestMethod.hashCode ^ queryParams.hashCode ^ requestHeaders.hashCode ^ requestBody.hashCode;
  }
}

/// Supported HTTP methods for API requests
enum ApiMethod {
  /// HTTP GET method
  get,

  /// HTTP POST method
  post,

  /// HTTP PUT method
  put,

  /// HTTP PATCH method
  patch,

  /// HTTP DELETE method
  delete,
}
