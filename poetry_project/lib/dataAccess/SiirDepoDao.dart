import 'dart:async';
import 'package:poetry_project/models/SiirDepo.dart';
import '../VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';
import 'SiirDepoRepository.dart';

class SiirDepoDao implements SiirDepoRepository {
  Future<List<SiirDepo>> tumSiirler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT*FROM siirDepo");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return SiirDepo.WithId(
          satir['id'], satir['siir_baslik'], satir['siir_icerik']);
    });
  }

  Future<void> siirEkle(String siir_baslik, String siir_icerik) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var bilgiler = <String, dynamic>{};
    bilgiler["siir_baslik"] = siir_baslik;
    bilgiler["siir_icerik"] = siir_icerik;

    await db.insert("siirDepo", bilgiler);
  }

  Future<void> siirSil(int id) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    await db.delete("siirDepo", where: "id=?", whereArgs: [id]);
  }

  Future<void> siirGuncelle(
      int id, String siir_baslik, String siir_icerik) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var bilgiler = <String, dynamic>{};
    bilgiler["id"] = id;
    bilgiler["siir_baslik"] = siir_baslik;
    bilgiler["siir_icerik"] = siir_icerik;

    await db.update("siirDepo", bilgiler, where: "id=?", whereArgs: [id]);
  }
}
