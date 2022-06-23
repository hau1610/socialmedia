class FriendData {
  String? sId;
  String? username;
  String? avatar;

  FriendData({this.sId, this.username, this.avatar});

  FriendData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['avatar'] = avatar;
    return data;
  }
}
