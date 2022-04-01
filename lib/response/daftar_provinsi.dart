import 'dart:convert';

DaftarPronvinsi daftarPronvinsiFromJson(String str) => DaftarPronvinsi.fromJson(json.decode(str));

String daftarPronvinsiToJson(DaftarPronvinsi data) => json.encode(data.toJson());

class DaftarPronvinsi {
  DaftarPronvinsi({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted,
    this.deletedAt,
    required this.countryId,
  });

  int id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic isDeleted;
  dynamic deletedAt;
  int countryId;

  factory DaftarPronvinsi.fromJson(Map<String, dynamic> json) => DaftarPronvinsi(
    id: json["id"],
    name: json["name"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    isDeleted: json["isDeleted"],
    deletedAt: json["deletedAt"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "isDeleted": isDeleted,
    "deletedAt": deletedAt,
    "country_id": countryId,
  };
}
