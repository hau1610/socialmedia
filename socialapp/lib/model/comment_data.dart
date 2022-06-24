class CommentData {
  List<Comments>? comments;
  List<Users>? users;

  CommentData({this.comments, this.users});

  CommentData.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? sId;
  String? userId;
  String? postId;
  String? desc;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Comments(
      {this.sId,
      this.userId,
      this.postId,
      this.desc,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    postId = json['postId'];
    desc = json['desc'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['postId'] = postId;
    data['desc'] = desc;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Users {
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
  int? iV;
  String? city;
  String? from;

  Users(
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
      this.updatedAt,
      this.iV,
      this.city,
      this.from});

  Users.fromJson(Map<String, dynamic> json) {
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
    iV = json['__v'];
    city = json['city'];
    from = json['from'];
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
    data['__v'] = iV;
    data['city'] = city;
    data['from'] = from;
    return data;
  }
}
