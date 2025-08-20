import 'package:dio/dio.dart';
import 'package:news_app/core/key_interceptors.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class ApiManger{
  late Dio dio;
  ApiManger(){
    dio=Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org",
      )
    )..interceptors.add(TalkerDioLogger(
      settings:TalkerDioLoggerSettings(
        printRequestData: true,
        printResponseData: true,
        printResponseMessage: true,
      ),
    ),)..interceptors.add(AuthInterceptor());
  }
  postApi(){
    
  }
  Future<Response> getApi(String endPoint, {Map<String, dynamic>?params}){
     return dio.get(endPoint,queryParameters: params);
  }
}