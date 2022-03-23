// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
    Ads({
        this.id,
        this.adminId,
        this.duration,
        this.adsTitle,
        this.adsDesc,
        this.adsPict,
        this.adsContact,
        this.adsLink,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    int? adminId;
    int? duration;
    String? adsTitle;
    String? adsDesc;
    String? adsPict;
    String? adsContact;
    String? adsLink;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        id: json["id"],
        adminId: json["admin_id"],
        duration: json["duration"],
        adsTitle: json["ads_title"],
        adsDesc: json["ads_desc"],
        adsPict: json["ads_pict"],
        adsContact: json["ads_contact"],
        adsLink: json["ads_link"],
        createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "duration": duration,
        "ads_title": adsTitle,
        "ads_desc": adsDesc,
        "ads_pict": adsPict,
        "ads_contact": adsContact,
        "ads_link": adsLink,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
