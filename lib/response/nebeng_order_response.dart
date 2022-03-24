import 'dart:convert';

import 'package:intake_customer/response/main_rider.dart';
import 'package:intake_customer/response/nebeng_response.dart';
import 'package:intake_customer/response/nebeng_order.dart';
import 'package:intake_customer/response/nebeng_rider.dart';

NebengOrderResponse nebengOrderResponseFromJson(String str) => NebengOrderResponse.fromJson(json.decode(str));

String nebengOrderResponseToJson(NebengOrderResponse data) => json.encode(data.toJson());

class NebengOrderResponse {
    NebengOrderResponse({
        this.nebengOrder,
        this.nebengPost,
        this.nebengRider,
        this.mainRider,
    });

    NebengOrder? nebengOrder;
    NebengResponse? nebengPost;
    NebengRider? nebengRider;
    MainRider? mainRider;

    factory NebengOrderResponse.fromJson(Map<String, dynamic> json) => NebengOrderResponse(
        nebengOrder: NebengOrder.fromJson(json["nebeng_order"]),
        nebengPost: NebengResponse.fromJson(json["nebeng_post"]),
        nebengRider: NebengRider.fromJson(json["nebeng_rider"]),
        mainRider: MainRider.fromJson(json["main_rider"]),
    );

    Map<String, dynamic> toJson() => {
        "nebengOrder": nebengOrder?.toJson(),
        "nebeng_post": nebengPost?.toJson(),
        "nebeng_rider": nebengRider?.toJson(),
        "main_rider": mainRider?.toJson(),
    };
}