// To parse this JSON data, do
//
//     final exchange = exchangeFromJson(jsonString);

import 'dart:convert';

Exchange? exchangeFromJson(String str) => Exchange.fromJson(json.decode(str));

String exchangeToJson(Exchange? data) => json.encode(data!.toJson());

class Exchange {
  Exchange({
    this.data,
    this.status,
  });

  List<Datum?>? data;
  Status? status;

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "status": status!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.slug,
    this.name,
    this.values,
    this.updatedAt,
  });

  int? id;
  String? slug;
  String? name;
  Values? values;
  String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        values: Values.fromJson(json["values"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "values": values!.toJson(),
        "updatedAt": updatedAt,
      };
}

class Values {
  Values({
    this.usd,
  });

  Usd? usd;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd!.toJson(),
      };
}

class Usd {
  Usd({
    this.volume24H,
    this.volume7D,
    this.volume30D,
  });

  int? volume24H;
  int? volume7D;
  int? volume30D;

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        volume24H: json["volume24h"],
        volume7D: json["volume7d"],
        volume30D: json["volume30d"],
      );

  Map<String, dynamic> toJson() => {
        "volume24h": volume24H,
        "volume7d": volume7D,
        "volume30d": volume30D,
      };
}

class Status {
  Status({
    this.time,
    this.success,
    this.code,
    this.message,
    this.responseTime,
    this.creditsCost,
  });

  DateTime? time;
  bool? success;
  int? code;
  String? message;
  int? responseTime;
  int? creditsCost;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        time: DateTime.parse(json["time"]),
        success: json["success"],
        code: json["code"],
        message: json["message"],
        responseTime: json["responseTime"],
        creditsCost: json["creditsCost"],
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toIso8601String(),
        "success": success,
        "code": code,
        "message": message,
        "responseTime": responseTime,
        "creditsCost": creditsCost,
      };
}
