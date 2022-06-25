import 'package:poetry_project/VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';
import 'package:poetry_project/models/Sair.dart';
import 'package:poetry_project/Wİdget/SairList.dart';

class SairlerDao {
  Future<List<Sair>> tumSairler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT*FROM sairler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Sair.WithId(satir["id"], satir["ad"], satir["slug"],
          satir["siirSayisi"], satir["bio"]);
    });
  }

  Future<List<Sair>> sairAra(String aramaKelimesi) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT*FROM sairler WHERE ad like '%$aramaKelimesi%' ");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Sair.WithId(satir["id"], satir["ad"], satir["slug"],
          satir["siirSayisi"], satir["bio"]);
    });
  }

  Future<List<Sair>> sairBioGetir(int id) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT*FROM sairler WHERE bio");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Sair.WithId(satir["id"], satir["ad"], satir["slug"],
          satir["siirSayisi"], satir["bio"]);
    });
  }
}
//neden boş görünüyor
