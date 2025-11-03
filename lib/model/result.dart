// JSON - MODEL 转换 方式3, 使用第三方库：json_annotation，dev:json_serializable: ^6.9.5 build_runner: ^2.5.4
// reslut.g.dart 将在我们运行生成命令flutter packages pub run build_runner build后自动生成. 我们的工具 将我们的实体类转换成map,将我们的map转换成实体类 这些工作。
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  //定义字段
  int code;
  String message;
  String requestPrams;

  Result(this.code, this.message, this.requestPrams);
  //固定格式，不同的类使用不同的mixin即可
  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);
  //固定格式，
  Map<String, dynamic> toJson() => _$ResultToJson(this);
  /// 按照以上格式写好之后， 使用命令 flutter packages pub run build_runner build 生成实体类转换json的代码。而且每次改了字段，都要重新运行命令。
}