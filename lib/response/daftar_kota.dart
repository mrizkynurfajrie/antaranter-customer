import 'dart:convert';

DaftarKota daftarKotaFromJson(String str) => DaftarKota.fromJson(json.decode(str));

String daftarKotaToJson(DaftarKota data) => json.encode(data.toJson());

class DaftarKota {
  DaftarKota({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.provinceId,
  });

  int id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int provinceId;

  factory DaftarKota.fromJson(Map<String, dynamic> json) => DaftarKota(
    id: json["id"],
    name: json["name"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    deletedAt: json["deletedAt"],
    provinceId: json["province_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "deletedAt": deletedAt,
    "province_id": provinceId,
  };
}