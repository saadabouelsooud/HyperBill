import 'package:dio/dio.dart';
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

    final dio = Dio(BaseOptions(baseUrl: serverPAth, connectTimeout: 5000, receiveTimeout: 5000,));
    final options = Options(headers: headers, contentType: contentType, responseType: responseType,);

    // if (onSendProgress == null) {
    //   onSendProgress = (int sent, int total) {
    //     Logger().v('$endPoint\n sent: $sent total: $total\n');
    //   };
    // }

    Logger().d(body.toString());
    Logger().d(headers);
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
            response =
            await dio.post(endPoint, queryParameters: queryParameters, onSendProgress: onSendProgress, data: body, options: options);
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
      return response; //map of string dynamic...

    } catch (e) {
      Logger().e('🌐🌐ERROR in http $type for $endPoint:🌐🌐\n' + e.toString());
      return null;
    }
  }
}