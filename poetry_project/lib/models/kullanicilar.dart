import 'package:flutter/material.dart';

class Kullanicilar {
  late int id;
  late String ad;
  late String soyad;
  late String sifre;
  Kullanicilar.empty();

  Kullanicilar(
    this.ad,
    this.soyad,
    this.sifre,
  );

  Kullanicilar.withId(this.id, this.ad, this.soyad, this.sifre);

  factory Kullanicilar.fromJson(Map<dynamic, dynamic> json) {
    return Kullanicilar(json["ad"] as String, json["soyad"] as String,
        json["sifre"] as dynamic);
  }

  // ignore: non_constant_identifier_names
  Map<String, dynamic> CevirMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["ad"] = ad;
    map["soyad"] = soyad;
    map["sifre"] = sifre;

    return map;
  }

  Kullanicilar.cevirObje(dynamic o) {
    this.id = o["id"]; //integere çevir tryParse(o["id"]);
    this.ad = o["ad"];
    this.soyad = o["soyad"];
  }
}
