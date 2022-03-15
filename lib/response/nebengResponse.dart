// To parse this JSON data, do
//
//     final nebengResponse = nebengResponseFromJson(jsonString);

import 'dart:convert';

NebengResponse nebengResponseFromJson(String str) => NebengResponse.fromJson(json.decode(str));

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

    factory NebengResponse.fromJson(Map<String, dynamic> json) => NebengResponse(
        id: json["id"],
        riderId: json["rider_id"],
        datetimeStart: DateTime.parse(json["datetimeStart"]),
        datetimeFinish: DateTime.parse(json["datetimeFinish"]),
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep: DateTime.parse(json["dateDep"]),
        dateArr: DateTime.parse(json["dateArr"]),
        timeDep: json["timeDep"],
        timeArr: json["timeArr"],
        seatAvail: json["seatAvail"],
        price: json["price"],
        status: json["status"],
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
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
    };
}
