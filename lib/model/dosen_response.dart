import 'dart:convert';

import 'dosen.dart';

DosenResponse dosenResponseFromJson(String str) =>
    DosenResponse.fromJson(json.decode(str));

String dosenResponseToJson(DosenResponse data) => json.encode(data.toJson());

class DosenResponse {
  DosenResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<Dosen> data;

  factory DosenResponse.fromJson(Map<String, dynamic> json) => DosenResponse(
        message: json["message"],
        data: List<Dosen>.from(json["data"].map((x) => Dosen.fromJson1(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson1())),
      };
}
