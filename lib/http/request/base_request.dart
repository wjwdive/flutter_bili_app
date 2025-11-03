enum HttpMethod {
  GET,
  POST,
  DELETE
}

abstract class BaseRequest{
  //curl -X GET "https://api.devio.org/uapi/test/test?requestPram=11" -H "accept: */*"
  //curl -X GET "https://api.devio.org/uapi/test/test/1"
  var pathParams;
  var useHttps = true;
  String authority(){
    return "api.devio.org";
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    if(pathParams != null){
      //拼接Path参数
      if(path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      }else {
        pathStr = "${path()}/$pathParams";
      }
    }
    //https http切换
    if(useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    }else {
      uri = Uri.https(authority(), pathStr, params);
    }

    print('url: ${uri.toString}');
    return uri.toString();
  }

  bool needLogin();
  Map<String, String> params = Map();

  //添加参数， 可以链式添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = Map();
  //添加Header
  BaseRequest addHeader(String k, Object v) {
    params[k] = v.toString();
    return this;
  }
}