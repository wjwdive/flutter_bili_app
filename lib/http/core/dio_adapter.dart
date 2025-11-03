// Dio适配器
import 'package:dio/dio.dart';
import 'package:flutter_bili_app/http/core/hi_adapter.dart';
import 'package:flutter_bili_app/http/core/hi_error.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

class DioAdapter extends HiNetAdapter { 
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
    var response, option = Options(headers: request.header) ;
    var error;
    try {
      if(request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: option);
      }else if(request.httpMethod() == HttpMethod.POST) {
        response = await Dio().post(request.url(), options: option);
      }else if(request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio().delete(request.url(), options: option);
      }
    }on DioException catch(e) {
      // 请求错误
      error = e;
      response = e.response;
      print(error);
    }
    if(error != null) {
      //抛出HiNetError
      throw HiNetError(response?.statusCode ?? -1 , error.toString(), data: buildRes(response, request));
    }

    //没有异常，返回数据
    return buildRes(response, request) as HiNetResponse<T>;
  }

  HiNetResponse buildRes(Response? response, BaseRequest request) {
    return HiNetResponse(
      data: response?.data,
      request: request,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
      extra: response
    );
  }
}