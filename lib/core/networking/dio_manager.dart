import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/error/errors.dart';
import 'package:msc_2/core/networking/api_constant.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/core/networking/status_code.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:msc_2/injection_container.dart' as di;

class DioManager implements ApiConsumer {
  Dio dio;
  DioManager({required this.dio}) {
    dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..connectTimeout = const Duration(seconds: 40)
      ..receiveTimeout = const Duration(seconds: 40)
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    //!Use Injection
    dio.interceptors.add(di.sl<PrettyDioLogger>());
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options,handler){
         String langcode = CacheHelper.get(key: "selected_language")??'en';
         String token = CacheHelper.getToken();
         token.isNotEmpty
         ? options.headers["Authorization"] = "Bearer $token"
         : null;
         options.headers["Accept-Language"] = langcode;
         return handler.next(options);
      }
    ));
    String token = CacheHelper.getToken();
    String langcode = CacheHelper.get(key: "selected_language")??"en";

    token.isNotEmpty
        ? dio.options.headers["Authorization"] = "Bearer $token"
        : null;
    // dio.options.headers["Accept-Language"] = langcode;
    print(token);
  }

  void updateLanguage(String langcode) {
    dio.options.headers["Accept-Language"] = langcode;
  }

  @override
  Future delete(String url, {Map<String, dynamic>? header, data}) async {
    try {
      final response =
          await dio.delete(url, data: data, options: Options(headers: header));
      return _handleResponseAsJson(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters,
      String? token,
      Map<String, dynamic>? header}) async {
    try {
      final response = await dio.get(path,
          options: Options(headers: header), queryParameters: queryParameters);
      return response;
      //  return _handleResponseAsJson(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters,
      String? token,
      FormData? body,
      Map<String, dynamic>? header}) async {
    try {
      final response = await dio.post(path,
          data: body,
          options: Options(headers: header,followRedirects: false,validateStatus: (status)=>status! < StatusCode.internalServerError),
          queryParameters: queryParameters);
      return response;
      // return _handleResponseAsJson(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future put(String url,
      {Map<String, dynamic>? header, Map<String, dynamic>? data}) async {
    try {
      final response =
          await dio.put(url, data: data, options: Options(headers: header));
      return _handleResponseAsJson(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  //Handel Response As JSON
  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = json.decode(response.data.toString());
    return responseJson;
  }

  //Handel Error
  dynamic _handleDioError(DioException error) {
    if (error.type
        case DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioException.receiveTimeout) {
      throw const FetchDataException();
    } else if (error.type case DioExceptionType.values) {
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw const BadRequestException();
        case StatusCode.unauthorized:
        case StatusCode.forbidden:
          throw const UnauthorizedException();
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.confilct:
          throw const ConflictException();

        case StatusCode.internalServerError:
          throw const InternalServerErrorException();
      }
    } else if (error.type case DioExceptionType.cancel) {
    } else if (error.type case DioExceptionType.unknown) {
      throw const NoInternetConnectionException();
    } else if (error.type
        case DioExceptionType.receiveTimeout ||
            DioExceptionType.badCertificate) {}
  }
}

