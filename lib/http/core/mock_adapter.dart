import 'package:flutter_bili_app/http/core/hi_adapter.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

///测试适配在，mock数据
class MockAdapter extends HiNetAdapter{
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse<T>>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse<T>(
        data: {"code": 0, "message": "success"} as T,
        statusCode: 200
      );
    });
  }
}