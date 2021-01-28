class User {
  int rating;
  String sId;
  String name;
  String username;
  String email;
  String password;
  String bio;
  String createdAt;
  int iV;

  User(
      {this.rating,
      this.sId,
      this.name,
      this.username,
      this.email,
      this.password,
      this.bio,
      this.createdAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    bio = json['bio'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['bio'] = this.bio;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
