import 'dart:convert';

import 'package:intake_customer/response/ads_response.dart';
import 'package:intake_customer/response/user.dart';

HomeResponse homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
    HomeResponse({
        this.user,
        this.adsResponse,
    });

    User? user;
    AdsResponse? adsResponse;

    factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        adsResponse: json["ads"] == null ? null : AdsResponse.fromJson(json["ads"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "ads": adsResponse?.toJson(),
    };
}