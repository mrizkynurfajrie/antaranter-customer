import 'package:intake_customer/response/ads.dart';

import 'dart:convert';

AdsResponse adsResponseFromJson(String str) => AdsResponse.fromJson(json.decode(str));

String adsResponseToJson(AdsResponse data) => json.encode(data.toJson());
class AdsResponse {
    AdsResponse({
        this.count,
        this.ads,
    });

    int? count;
    List<Ads?>? ads;

    factory AdsResponse.fromJson(Map<String, dynamic> json) => AdsResponse(
        count: json["count"],
        ads: List<Ads>.from(json["rows"].map((x) => Ads.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "ads": ads == null ? null : List<dynamic>.from(ads!.map((x) => x?.toJson())),
    };
}