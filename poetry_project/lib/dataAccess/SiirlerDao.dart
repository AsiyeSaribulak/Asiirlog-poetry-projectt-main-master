import 'package:flutter/material.dart';
import 'package:poetry_project/models/Sair.dart';
import 'package:poetry_project/models/Siir.dart';

import '../VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';
import '../models/Favori.dart';
import 'SiirlerRepository.dart';

class SiirlerDao implements SiirlerRepository {
  Future<List<Siir>> tumSiirlerBySairId(int sairId) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM siirler, sairler "
            "WHERE siirler.sair_id = sairler.id "
            "and siirler.sair_id=$sairId");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      var sairTablo = Sair.WithId(satir["id"], satir["ad"], satir["slug"],
          satir["siirSayisi"], satir["bio"]);
      var siirTablo = Siir.WithId(
          satir["id"],
          satir["baslik"],
          satir["icerik"],
          satir["sair_id"],
          satir["is_favorite"],
          satir["ad"],
          satir["slug"],
          sairTablo);

      return siirTablo;
    });
  }

  Future<List<Siir>> randomSiir(int siirId) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM siirler, sairler "
            "WHERE siirler.sair_id = sairler.id "
            "ORDER BY RANDOM() LIMIT 1");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      var sairTab = Sair.WithId(satir["id"], satir["ad"], satir["slug"],
          satir["siirSayisi"], satir["bio"]);
      var siirTab = Siir.WithId(
          satir["id"],
          satir["baslik"],
          satir["icerik"],
          satir["sair_id"],
          satir["is_favorite"],
          satir["ad"],
          satir["slug"],
          sairTab);

      return siirTab;
    });
  }

  Future<List<Siir>> tumSiirler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT*FROM siirler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Siir(satir["id"], satir["baslik"], satir["icerik"],
          satir["sair_id"], satir["is_favorite"], satir["ad"], satir["slug"]);
    });
  }

  Future<List<Favori>> tumFavoriler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT *FROM favoriler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Favori.withID(satir["id"], satir["siir_id"], satir["siir_baslik"],
          satir["siir_icerik"], satir["sair_ad"], satir["sair_slug"]);
    });
  }

  Future<void> favoriEkleSql(int siir_id, String siir_baslik,
      String siir_icerik, String sair_ad, String sair_slug) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["siir_id"] = siir_id;
    bilgiler["siir_baslik"] = siir_baslik;
    bilgiler["siir_icerik"] = siir_icerik;
    bilgiler["sair_ad"] = sair_ad;
    bilgiler["sair_slug"] = sair_slug;
    await db.insert("favoriler", bilgiler);
  }

  Future<void> favoriSil(int siir_id) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    await db.delete("favoriler", where: "siir_id=?", whereArgs: [siir_id]);
  }
}
