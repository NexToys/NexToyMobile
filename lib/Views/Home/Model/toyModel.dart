import '../../../Core/Base/base_model.dart';

class Toy extends BaseModel {
  String id;
  bool isActive;
  String name;
  String description;
  String type;
  String image;
  String ownerId;
  String createdAt;

  Toy(
      {this.id,
      this.isActive,
      this.name,
      this.description,
      this.type,
      this.image,
      this.ownerId,
      this.createdAt});

  Toy fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    isActive = json['isActive'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    image = json['imageurl'];
    ownerId = json['ownerId'];
    createdAt = json['createdAt'].toString();
    return Toy(
        id: id,
        isActive: isActive,
        name: name,
        description: description,
        type: type,
        image: image,
        ownerId: ownerId,
        createdAt: createdAt);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['isActive'] = this.isActive;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['imageurl'] = this.image;
    data['ownerId'] = this.ownerId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
/*
final toys = [
  Toy(
      name: "Bebek",
      desctription: "bu bir açıklamadır. Ciddiye almayın!!!",
      image: "assets/image/oyuncak.jpg"),
  Toy(
      name: "Araba",
      desctription: "bu bir açıklamadır. Ciddiye almayın!!!",
      image: "assets/image/oyuncak2.jpg"),
  Toy(
      name: "Kamyon",
      desctription: "Saçmaladım. Ciddiye almayın!!!",
      image: "assets/image/oyuncak.jpg"),
  Toy(
      name: "Motor",
      desctription: "Sıkıldımmm beeea. Ciddiye almayın!!!",
      image: "assets/image/oyuncak2.jpg"),
  Toy(
      name: "Yedek",
      desctription: "bu bir açıklamadır. Ciddiye almayın!!!",
      image: "assets/image/oyuncak.jpg"),
  Toy(
      name: "Seper",
      desctription: "bu bir açıklamadır. Ciddiye almayın!!!",
      image: "assets/image/oyuncak2.jpg"),
  Toy(
      name: "Bebek",
      desctription: "bu bir açıklamadır. Ciddiye almayın!!!",
      image: "assets/image/oyuncak.jpg"),
];
*/
