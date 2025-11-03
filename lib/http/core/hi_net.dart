// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bili_app/http/core/hi_adapter.dart';
import 'package:flutter_bili_app/http/core/hi_error.dart';
import 'package:flutter_bili_app/http/core/mock_adapter.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

//创建一个单例，单例的固定写法。
class HiNet{
  HiNet._();
  //懒汉模式，饿汉模式，这里是懒汉模式，用到HiNet的时候才创建
  static late final HiNet _instance = HiNet._();
  static HiNet get instance => _instance;
  static HiNet getInstance() => _instance;

  Future fire(BaseRequest request) async {
    HiNetResponse? response;
    Object? error;
    try {
      response = await send<Map>(request);
    } on HiNetError catch(e) {
      error = e;
      response = e.data;
      printLog(e.message); 
    } catch(e) {
      //其他异常
      error = e;
      printLog(e);
    }

    if(response == null) {
      printLog(error);
    }

    var result = response?.data;
    printLog(result);
    var status = response?.statusCode;

    switch(status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw HiNetError(status!, result.toString(), data: result);
    }
  }

// 发送网络请求的方法，send， 是dynamic类型的，
  Future<dynamic>send<T>(BaseRequest request) async {
    printLog('url:${request.url()}');
    printLog('method:${request.httpMethod()}');
    request.addHeader("token", "123");
    printLog("header:${request.header}");
    //模拟数据
    HiNetAdapter adapter = MockAdapter();
    return adapter.send(request);
    // return Future.value({
    //             "statusCode": 200, 
    //             "data": {"code": 0, "message": "success"}
    //             });

  }

  void printLog(log) {
    print('hi_net:${log.toString()}');
  }

}