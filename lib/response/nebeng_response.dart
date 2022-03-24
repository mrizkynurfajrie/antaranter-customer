// To parse this JSON data, do
//
//     final nebengResponse = nebengResponseFromJson(jsonString);

import 'dart:convert';

import 'package:intake_customer/response/main_rider.dart';
import 'package:intake_customer/response/nebeng_rider.dart';

NebengResponse nebengResponseFromJson(String str) =>
    NebengResponse.fromJson(json.decode(str));

String nebengResponseToJson(NebengResponse data) => json.encode(data.toJson());

class NebengResponse {
  NebengResponse({
    this.id,
    this.riderId,
    this.datetimeStart,
    this.datetimeFinish,
    this.cityOrigin,
    this.cityDestination,
    this.dateDep,
    this.dateArr,
    this.timeDep,
    this.timeArr,
    this.seatAvail,
    this.price,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.mainRider,
    this.nebengRider,
  });

  int? id;
  int? riderId;
  DateTime? datetimeStart;
  DateTime? datetimeFinish;
  String? cityOrigin;
  String? cityDestination;
  DateTime? dateDep;
  DateTime? dateArr;
  String? timeDep;
  String? timeArr;
  int? seatAvail;
  int? price;
  int? status;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isDeleted;
  MainRider? mainRider;
  NebengRider? nebengRider;

  factory NebengResponse.fromJson(Map<String, dynamic> json) => NebengResponse(
        id: json["id"],
        riderId: json["rider_id"],
        datetimeStart: json["datetimeStart"] == null
            ? null
            : DateTime.parse(json["datetimeStart"]),
        datetimeFinish: json["datetimeFinish"] == null
            ? null
            : DateTime.parse(json["datetimeFinish"]),
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep: json["dateDep"] == null
            ? null
            : DateTime.parse(json["dateDep"]),
        dateArr: json["dateArr"] == null
            ? null
            : DateTime.parse(json["dateArr"]),
        timeDep: json["timeDep"],
        timeArr: json["timeArr"],
        seatAvail: json["seatAvail"],
        price: json["price"],
        status: json["status"],
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        mainRider: json["main_rider"] == null
            ? null
            : MainRider.fromJson(json["main_rider"]),
        nebengRider: json["nebeng_rider"] == null
            ? null
            : NebengRider.fromJson(json["nebeng_rider"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "datetimeStart": datetimeStart,
        "datetimeFinish": datetimeFinish,
        "city_origin": cityOrigin,
        "city_destination": cityDestination,
        "dateDep": dateDep,
        "dateArr": dateArr,
        "timeDep": timeDep,
        "timeArr": timeArr,
        "seatAvail": seatAvail,
        "price": price,
        "status": status,
        "note": note,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "isDeleted": isDeleted,
        "main_rider": mainRider?.toJson(),
        "nebeng_rider": nebengRider?.toJson(),
      };

  factory NebengResponse.fromArguments(Map<String, dynamic> json) =>
      NebengResponse(
        id: json["id"],
        riderId: json["rider_id"],
        datetimeStart: json["datetimeStart"],
        datetimeFinish: json["datetimeFinish"],
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep: json["dateDep"],
        dateArr: json["dateArr"],
        timeDep: json["timeDep"],
        timeArr: json["timeArr"],
        seatAvail: json["seatAvail"],
        price: json["price"],
        status: json["status"],
        note: json["note"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        isDeleted: json["isDeleted"],
        mainRider: MainRider.fromArguments(json["main_rider"]),
        nebengRider: NebengRider.fromArguments(json["nebeng_rider"]),
      );
}
