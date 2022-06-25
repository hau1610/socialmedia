class PostData {
  String? sId;
  String? userId;
  String? desc;
  List<String>? likes;
  String? createdAt;
  String? updatedAt;
  List<Comments>? comments;

  PostData(
      {this.sId,
      this.userId,
      this.desc,
      this.likes,
      this.createdAt,
      this.updatedAt,
      this.comments});

  PostData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    desc = json['desc'];
    likes = json['likes'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['desc'] = desc;
    data['likes'] = likes;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
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
