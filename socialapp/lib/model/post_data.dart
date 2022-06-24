class PostData {
  String? sId;
  String? userId;
  String? desc;
  List<String>? likes;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PostData(
      {this.sId,
      this.userId,
      this.desc,
      this.likes,
      this.createdAt,
      this.updatedAt,
      this.iV});

  PostData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    desc = json['desc'];
    likes = json['likes'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['desc'] = desc;
    data['likes'] = likes;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
