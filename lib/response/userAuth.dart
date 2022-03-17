import 'dart:convert';

UserAuth welcomeFromJson(String str) => UserAuth.fromJson(json.decode(str));

String welcomeToJson(UserAuth data) => json.encode(data.toJson());

  class UserAuth {
  UserAuth({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    required this.birth,
    required this.phone,
    required this.status,
  });

  int id;
  dynamic username;
  dynamic email;
  dynamic image;
  dynamic birth;
  String phone;
  dynamic status;

  factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    image: json["image"],
    birth: json["birth"],
    phone: json["phone"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "image": image,
    "birth": birth,
    "phone": phone,
    "status": status,
  };
}
