
//需要登录的异常
class NeedLogin extends HiNetError {
  NeedLogin({int code = 401, String message = "请先登录"}) : super(code, message);
}

//需要授权的异常
class NeedAuth extends HiNetError {
  NeedAuth(String message, {int code = 403, dynamic data}) : super(code, message, data: data);
}

///网络异常统一格式类 
class HiNetError implements Exception {
  final int code; //错误码
  final String message; //错误信息
  final dynamic data;//错误数据 声明为dynamic类型，x兼容所有数据类型

  //构造函数， 前两个是必填的，data是可选的
  HiNetError(this.code, this.message, {this.data});

  @override
  String toString() {
    return message;
  }
}