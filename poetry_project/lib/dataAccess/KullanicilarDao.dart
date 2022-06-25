import 'package:poetry_project/VeriTabaniYardimcisi/VeriTabaniYardimcisi.dart';
import 'package:poetry_project/models/kullanicilar.dart';

class KullanicilarDao {
  Future<List<Kullanicilar>> tumKisiler() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT*FROM kullanicilar");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kullanicilar.withId(
          satir["id"], satir["ad"], satir["soyad"], satir["sifre"]);
    });
  }
}
