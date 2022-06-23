class UserInfo {
  String? id;
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
  int? iV;
  String? city;
  String? from;

  UserInfo(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.avatar,
      this.background,
      this.followers,
      this.followings,
      this.friends,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.city,
      this.from});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
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
    iV = json['__v'];
    city = json['city'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
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
    data['__v'] = iV;
    data['city'] = city;
    data['from'] = from;
    return data;
  }
}
