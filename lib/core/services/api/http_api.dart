import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/services/api/wrapper_model.dart';
import 'package:logger/logger.dart';

import 'api.dart';

class HttpApi {
  static String serverPAth = 'https://tvexs.com:9092/api/selfservice/';

  static Future<Response> request(String endPoint,
      {body,
      Function onSendProgress,
      Map<String, dynamic> headers,
      String type = RequestType.Get,
      Map<String, dynamic> queryParameters,
      String contentType = Headers.jsonContentType,
      ResponseType responseType = ResponseType.json}) async {
    Response response;

    final dio = Dio(BaseOptions(
      baseUrl: serverPAth,
      connectTimeout: 50000,
      receiveTimeout: 50000,
    ));

    final options = Options(
        headers: headers,
        contentType: contentType,
        responseType: responseType,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        });

    // if (onSendProgress == null) {
    //   onSendProgress = (int sent, int total) {
    //     Logger().v('$endPoint\n sent: $sent total: $total\n');
    //   };
    // }
    // dio.interceptors.add(CustomInterceptors());
    Logger().d(body.toString());
    Logger().d(headers);
    try {
      switch (type) {
        case RequestType.Get:
          {
            response = await dio.get(endPoint, queryParameters: queryParameters, options: options);
          }
          break;
        case RequestType.Post:
          {
            response = await dio.post(endPoint, queryParameters: queryParameters, onSendProgress: onSendProgress, data: body, options: options);
          }
          break;
        case RequestType.Put:
          {
            response = await dio.put(endPoint, queryParameters: queryParameters, data: body, options: options);
          }
          break;
        case RequestType.Delete:
          {
            response = await dio.delete(endPoint, queryParameters: queryParameters, data: body, options: options);
          }
          break;
        default:
          break;
      }

      Logger().d('$type $endPoint\n$headers\nstatusCode:${response.statusCode}\n');
      Logger().d(response);
      return response;
    } catch (e) {
      Logger().e('🌐🌐ERROR in http $type for $endPoint:🌐🌐\n' + e.toString());
      return null;
    }
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print('ERROR[${err.response.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}

class HttpApis {
  static String serverPAth = 'https://tvexs.com:9092/api/selfservice/';

  static Future<Response> request(String endPoint,
      {body,
      Function onSendProgress,
      Map<String, dynamic> headers,
      String type = RequestType.Get,
      Map<String, dynamic> queryParameters,
      String contentType = Headers.jsonContentType,
      ResponseType responseType = ResponseType.json}) async {
    Response response;

    final dio = Dio(BaseOptions(
      baseUrl: serverPAth,
      connectTimeout: 50000,
      receiveTimeout: 50000,
    ));

    final options = Options(
        headers: headers,
        contentType: contentType,
        responseType: responseType,
        followRedirects: false,
        validateStatus: (status) {
          return status >= 200 && status <= 300;
        });

    // if (onSendProgress == null) {
    //   onSendProgress = (int sent, int total) {
    //     Logger().v('$endPoint\n sent: $sent total: $total\n');
    //   };
    // }
    // dio.interceptors.add(CustomInterceptors());
    Logger().d(body.toString());
    Logger().d(headers);
    try {
      switch (type) {
        case RequestType.Get:
          {
            response = await dio.get(endPoint, queryParameters: queryParameters, options: options);
          }
          break;
        case RequestType.Post:
          {
            response = await dio.post(endPoint, queryParameters: queryParameters, onSendProgress: onSendProgress, data: body, options: options);
          }
          break;
        case RequestType.Put:
          {
            response = await dio.put(endPoint, queryParameters: queryParameters, data: body, options: options);
          }
          break;
        case RequestType.Delete:
          {
            response = await dio.delete(endPoint, queryParameters: queryParameters, data: body, options: options);
          }
          break;
        default:
          break;
      }

      Logger().d('$type $endPoint\n$headers\nstatusCode:${response.statusCode}\n');
      Logger().d(response);
      return response.data;
    } catch (e) {


      Logger().e('🌐🌐ERROR in http $type for $endPoint:🌐🌐\n' + e.toString());
      return null;
    }
  }
}
