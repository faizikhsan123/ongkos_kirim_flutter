// To parse this JSON data, do
//
//     final ongkir = ongkirFromJson(jsonString);

import 'dart:convert';

Ongkir ongkirFromJson(String str) => Ongkir.fromJson(json.decode(str));

String ongkirToJson(Ongkir data) => json.encode(data.toJson());

class Ongkir {
    String name;
    String service;
    int cost;
    String etd;

    Ongkir({
        required this.name,
        required this.service,
        required this.cost,
        required this.etd,
    });

    factory Ongkir.fromJson(Map<String, dynamic> json) => Ongkir(
        name: json["name"],
        service: json["service"],
        cost: json["cost"],
        etd: json["etd"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "service": service,
        "cost": cost,
        "etd": etd,
    };
}
