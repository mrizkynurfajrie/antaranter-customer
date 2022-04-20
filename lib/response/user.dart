// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.username,
        this.email,
        this.password,
        this.nik,
        this.ktpPict,
        this.image,
        this.birth,
        this.address,
        this.phone,
        this.status,
        this.lat,
        this.lang,
        this.city,
        this.role,
        this.fcm,
        this.gender,
        this.blockedAt,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    String? username;
    String? email;
    String? password;
    String? nik;
    String? ktpPict;
    String? image;
    DateTime? birth;
    String? address;
    String? phone;
    int? status;
    double? lat;
    double? lang;
    String? city;
    String? role;
    String? fcm;
    String? gender;
    DateTime? blockedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        nik: json["nik"],
        ktpPict: json["ktp_pict"],
        image: json["image"],
        birth:json["birth"] == null ? null : DateTime.parse(json["birth"]),
        address: json["address"],
        phone: json["phone"],
        status: json["status"],
        lat: json["lat"],
        lang: json["lang"],
        city: json["city"],
        role: json["role"],
        fcm: json["fcm"],
        gender: json["gender"],
        blockedAt: json["blockedAt"] == null ? null : DateTime.parse(json["blockedAt"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "nik": nik,
        "ktp_pict": ktpPict,
        "image": image,
        "birth": birth?.toIso8601String(),
        "address": address,
        "phone": phone,
        "status": status,
        "lat": lat,
        "lang": lang,
        "city": city,
        "role": role,
        "fcm": fcm,
        "gender": gender,
        "blockedAt": blockedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
