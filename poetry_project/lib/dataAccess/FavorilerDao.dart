import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:poetry_project/VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';
import 'package:poetry_project/dataAccess/FavorilerRepository.dart';
import 'package:poetry_project/models/Favori.dart';

class FavorilerDao implements FavorilerRepository {
  Future<List<Favori>> tumFavoriler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT*FROM favori");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Favori.withID(satir["id"], satir["siir_id"], satir["siir_baslik"],
          satir["siir_icerik"], satir["sair_ad"], satir["sair_slug"]);
    });
  }

  Future<void> favoriEkleSql(int siir_id, String siir_baslik,
      String siir_icerik, String sair_ad, String sair_slug) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    if (db != null) {
      var bilgiler = Map<String, dynamic>();
      bilgiler["siir_id"] = siir_id;
      bilgiler["baslik"] = siir_baslik;
      bilgiler["icerik"] = siir_icerik;
      bilgiler["sair_ad"] = sair_ad;
      bilgiler["sair_slug"] = sair_slug;
      await db.insert("favori", bilgiler);
    } else {
      print("veri tabanına eklenemedi");
    }
  }

  Future<void> favoriSil(int siir_id) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    await db.delete("favoriler", where: "siir_id=?", whereArgs: [siir_id]);
  }

  var refKullanicilar = FirebaseDatabase.instance.ref().child("favoriler");
  Future<void> favoriEkle() async {
    var bilgiler = HashMap<String, dynamic>();
    bilgiler["id"] = " ";
    bilgiler["siir_id"] = " ";
    refKullanicilar.push().set(bilgiler);
  }
}
