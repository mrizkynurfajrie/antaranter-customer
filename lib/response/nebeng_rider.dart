// To parse this JSON data, do
//
//     final nebengRider = nebengRiderFromJson(jsonString);

import 'dart:convert';

NebengRider nebengRiderFromJson(String str) => NebengRider.fromJson(json.decode(str));

String nebengRiderToJson(NebengRider data) => json.encode(data.toJson());

class NebengRider {
    NebengRider({
        this.id,
        this.riderId,
        this.statusNebeng,
        this.sim,
        this.simPict,
        this.simExp,
        this.stnkPict,
        this.lat,
        this.lang,
        this.rating,
        this.vehicleVariant,
        this.platNumber,
        this.vehicleColor,
    });

    int? id;
    int? riderId;
    int? statusNebeng;
    String? sim;
    String? simPict;
    DateTime? simExp;
    String? stnkPict;
    double? lat;
    double? lang;
    int? rating;
    String? vehicleVariant;
    String? platNumber;
    String? vehicleColor;

    factory NebengRider.fromJson(Map<String, dynamic> json) => NebengRider(
        id: json["id"],
        riderId: json["rider_id"],
        statusNebeng:json["statusNebeng"],
        sim: json["sim"],
        simPict: json["simPict"],
        simExp: json["simExp"] == null ? null : DateTime.parse(json["simExp"]),
        stnkPict: json["stnkPict"],
        lat: json["lat"],
        lang: json["lang"],
        rating: json["rating"],
        vehicleVariant: json["vehicle_variant"],
        platNumber: json["plat_number"],
        vehicleColor: json["vehicle_color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "statusNebeng": statusNebeng,
        "sim": sim,
        "simPict": simPict,
        "simExp": simExp,
        "stnkPict": stnkPict,
        "lat": lat,
        "lang": lang,
        "rating": rating,
        "vehicle_variant": vehicleVariant,
        "plat_number": platNumber,
        "vehicle_color": vehicleColor,
    };

    factory NebengRider.fromArguments(Map<String, dynamic> json) => NebengRider(
        id: json["id"],
        riderId: json["rider_id"],
        statusNebeng:json["statusNebeng"],
        sim: json["sim"],
        simPict: json["simPict"],
        simExp: json["simExp"],
        stnkPict: json["stnkPict"],
        lat: json["lat"],
        lang: json["lang"],
        rating: json["rating"],
        vehicleVariant: json["vehicle_variant"],
        platNumber: json["plat_number"],
        vehicleColor: json["vehicle_color"],
    );
}
