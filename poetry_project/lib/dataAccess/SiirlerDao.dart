import 'package:flutter/material.dart';
import 'package:poetry_project/models/Sair.dart';
import 'package:poetry_project/models/Siir.dart';

import '../VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';

class SiirlerDao extends ChangeNotifier {
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
      notifyListeners();
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
}
