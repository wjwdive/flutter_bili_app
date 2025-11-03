// JSON - MODEL 转换 方式2
//https://www.geekailab.com/io/tools/json-to-dart/
//使用网页 把json 转成dart Model类
class TestMo {
  String? id;
  String? vid;
  String? tit1e;
  String? tname;
  String? url;
  String? cover;
  int? pubdate;
  String? desc;
  int? view;
  int? duration;
  Owner? owner;
  int? reply;
  int? favorite;
  int? i1ike;
  int? coin;
  int? share;
  String? createTime;
  int? size;

  TestMo(
      {this.id,
      this.vid,
      this.tit1e,
      this.tname,
      this.url,
      this.cover,
      this.pubdate,
      this.desc,
      this.view,
      this.duration,
      this.owner,
      this.reply,
      this.favorite,
      this.i1ike,
      this.coin,
      this.share,
      this.createTime,
      this.size});

  TestMo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    tit1e = json['tit1e'];
    tname = json['tname'];
    url = json['url'];
    cover = json['cover'];
    pubdate = json['pubdate'];
    desc = json['desc'];
    view = json['view'];
    duration = json['duration'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    reply = json['reply'];
    favorite = json['favorite'];
    i1ike = json['1ike'];
    coin = json['coin'];
    share = json['share'];
    createTime = json['createTime'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['tit1e'] = this.tit1e;
    data['tname'] = this.tname;
    data['url'] = this.url;
    data['cover'] = this.cover;
    data['pubdate'] = this.pubdate;
    data['desc'] = this.desc;
    data['view'] = this.view;
    data['duration'] = this.duration;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['reply'] = this.reply;
    data['favorite'] = this.favorite;
    data['1ike'] = this.i1ike;
    data['coin'] = this.coin;
    data['share'] = this.share;
    data['createTime'] = this.createTime;
    data['size'] = this.size;
    return data;
  }
}

class Owner {
  String? name;
  String? face;
  int? fans;

  Owner({this.name, this.face, this.fans});

  Owner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    face = json['face'];
    fans = json['fans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['face'] = this.face;
    data['fans'] = this.fans;
    return data;
  }
}
