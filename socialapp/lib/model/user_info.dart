class UserInfo {
  String? sId;
  String? username;
  String? email;
  String? password;
  String? avatar;
  String? background;
  List<String>? followers;
  List<String>? followings;
  List<String>? friends;
  String? createdAt;
  String? updatedAt;

  UserInfo(
      {this.sId,
      this.username,
      this.email,
      this.password,
      this.avatar,
      this.background,
      this.followers,
      this.followings,
      this.friends,
      this.createdAt,
      this.updatedAt});

  UserInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    avatar = json['avatar'];
    background = json['background'];
    followers = json['followers'].cast<String>();
    followings = json['followings'].cast<String>();
    friends = json['friends'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['avatar'] = avatar;
    data['background'] = background;
    data['followers'] = followers;
    data['followings'] = followings;
    data['friends'] = friends;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
