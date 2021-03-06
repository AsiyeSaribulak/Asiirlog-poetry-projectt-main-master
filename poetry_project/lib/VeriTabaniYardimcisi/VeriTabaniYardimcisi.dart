import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeriTabaniYardimcisi {
  static final String veritabaniAdi = "database.db";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("veritabanı mevcut kopyalamaya gerek yok");
    } else {
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("veritabani kopyalandı");
    }
    Database database = await openDatabase(veritabaniYolu, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          ''' CREATE TABLE favori (id INTEGER PRİMARY KEY AUTOINCREMENT,siir_id INTEGER NOT NULL,siir_baslik TEXT NOT NULL, siir_icerik TEXT NOT NULL, sair_ad Text NOT NULL,sair_slug TEXT,
          FOREIGN KEY("siir_id") REFERENCES "siirler"("id") ON DELETE CASCADE ON UPDATE CASCADE) ''');
      await db.execute(
          'CREATE TABLE siirDepo (id INTEGER PRIMARY KEY, siir_baslik TEXT NOT NULL,siir_icerik TEXT NOT NULL)');
    });

    return database;
  }
}
