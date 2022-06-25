import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:poetry_project/VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';
import 'package:poetry_project/models/Favori.dart';

class FavorilerDao {
  Future<List<Favori>> tumFavoriler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT *FROM favoriler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Favori.withID(satir["id"], satir["siir_id"], satir["begeni"]);
    });
  }

  Future<void> favoriEkleSql(int siir_id) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["siir_id"] = siir_id;
    await db.insert("favoriler", bilgiler);
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
