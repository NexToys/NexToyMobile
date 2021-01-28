class Toy {
  String sId;
  bool isActive;
  String imageurl;
  String name;
  String description;
  String type;
  String ownerId;
  String createdAt;
  int iV;

  Toy(
      {this.sId,
      this.isActive,
      this.imageurl,
      this.name,
      this.description,
      this.type,
      this.ownerId,
      this.createdAt,
      this.iV});

  Toy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['isActive'];
    imageurl = json['imageurl'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    ownerId = json['ownerId'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isActive'] = this.isActive;
    data['imageurl'] = this.imageurl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['ownerId'] = this.ownerId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
