// JSON - MODEL 转换 方式1,
// 手动处理model和map的转换，手动编写序列化代码，但是应该避免手动处理，建议使用json_serializable 库来处理。
class Owner {
  final String name;
  final String face;
  final int fans;

  const Owner({this.name = "", this.face = "", this.fans = 0});

  //将map转成model
  factory Owner.fromJson(Map<String, dynamic> json) {
    if(json == null) {
      return const Owner();
    }
    return Owner(
      name: json['name'] as String? ?? '',
      face: json['face'] as String? ?? '',
      fans: int.tryParse(json['fans']?.toString() ?? '0') ?? 0
    );
  }

  //将model转成map
  // Map<String, dynamic> toJson() => {
  //   "name": name,
  //   "face": face,
  //   "fans": fans,
  // };

  //旧的写法
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data["name"] = name;
    data["face"] = face;
    data["fans"] = fans;
    return data;
  }

  @override
  String toString() {
    return 'Owner{name: $name, face: $face, fans: $fans}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Owner &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          face == other.face &&
          fans == other.fans;

  @override
  int get hashCode => Object.hash(name, face, fans);
  // name.hashCode ^ face.hashCode ^ fans.hashCode;
}