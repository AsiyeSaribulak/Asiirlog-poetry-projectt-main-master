import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';
import '../models/Ayarlar.dart';
import '../models/Sair.dart';
import '../models/Siir.dart';

class VeriTabaniYardimcisi {
  static final VeriTabaniYardimcisi _instance = VeriTabaniYardimcisi.internal();

  factory VeriTabaniYardimcisi() => _instance;

  final int _dbVersion = 1;

  final String tableSairler = 'sairler';
  final String columnId = 'id';
  final String columnAd = 'ad';
  final String columnSlug = 'slug';
  final String columnSiirSayisi = 'SiirSayisi';
  final String columnBio = 'bio';
  final String tableSiirler = 'siirler';
  final String columnBaslik = 'baslik';
  final String columnIcerik = 'icerik';
  final String columnIsFavorite = 'is_favorite';
  final String columnSairID = 'sair_id';
  final String tableSettings = 'settings';
  final String columnTema = 'tema';
  final String columnFontSize = 'font_size';
  final String columnSendDaily = 'send_daily';
  final String columnShowAds = 'show_ads';

  late Database _db;
  static Lock lock = Lock();

  VeriTabaniYardimcisi.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    await lock.synchronized(initDb);

    return _db;
  }

  Future<void> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database-v$_dbVersion.db');

    if (_db == null) {
      try {
        _db = await openDatabase(path, readOnly: true);
        if (_db != null) {
          await _db.close();
          _db = await openDatabase(path, readOnly: false);
        }
      } catch (e) {
        print("Error $e");
      }

      if (_db == null) {
        print("veritabanı kopyalandı");

        ByteData data =
            await rootBundle.load(join("veriTabani", "asiirlog.sqbpro"));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await new File(path).writeAsBytes(bytes);

        _db = await openDatabase(path, readOnly: false);
      } else {
        print("Opening existing database");
      }
    }
  }

  Future<Ayarlar?> getAyarlar() async {
    var dbClient = await db;
    var result = await dbClient.query(tableSettings, columns: [
      columnTema,
      columnFontSize,
      columnShowAds,
      columnSendDaily,
    ]);

    if (result.length > 0) {
      return Ayarlar.fromMap(result.first);
    }

    return null;
  }

  Future<int> updateTema(int tema) async {
    var dbClient = await db;
    return await dbClient
        .rawUpdate(' update $tableSettings set $columnTema = ? ', [tema]);
  }

  Future<int> updateFontSize(int fontSize) async {
    var dbClient = await db;
    return await dbClient.rawUpdate(
        'update $tableSettings set $columnFontSize = ? ', [fontSize]);
  }

  Future<int> saveSair(Sair sair) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableSairler, sair.CevirMap());

    return result;
  }

  Future<List> getAllSairler() async {
    var dbClient = await db;
    var result = await dbClient.query(tableSairler,
        columns: [columnId, columnAd, columnSlug, columnSiirSayisi],
        orderBy: '$columnAd asc');

    return result.toList();
  }

  Future<Sair?> getSairBySlug(String slug) async {
    var dbClient = await db;
    var result = await dbClient.query(tableSairler,
        columns: [columnId, columnAd, columnSlug, columnBio, columnSiirSayisi],
        where: '$columnSlug = ?',
        whereArgs: [slug]);

    if (result.length > 0) {
      return Sair.fromMap(result.first);
    }

    return null;
  }

  Future<List> arama(String query) async {
    var dbClient = await db;
    String whereArg = '%$query%';
    var resultSiirler = await dbClient.rawQuery(
        'select siirler.id , $columnIsFavorite, $columnBaslik , $columnSairID , $columnIcerik , $columnAd , $columnSlug ' +
            ' from siirler ' +
            'left join sairler on sairler.id = siirler.sair_id ' +
            "where (title like upper('$whereArg')) or (title like lower('$whereArg')) ");

    var resultSairler = await dbClient.query(tableSairler,
        columns: [columnId, columnSlug, columnAd, columnBio],
        where:
            "($columnAd like upper('$whereArg')) or ($columnAd like lower('$whereArg')) ");

    List result = [resultSairler.toList(), resultSiirler.toList()];
    return result;
  }

  Future<List> getFavorites() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        'select siirler.id , $columnIsFavorite, $columnBaslik , $columnSairID , $columnIcerik , $columnAd , $columnSlug ' +
            ' from siirler ' +
            'left join sairler on sairler.id = siirler.sair_id ' +
            'where is_favorite = ?',
        [1]);

    return result;
  }

  Future<List> getRandom(int random) async {
    var dbClient = await db;
    var sql = " select " +
        " siirler.id , is_favorite, baslik , sair_id , icerik, ad, slug " +
        " from siirler left join sairler " +
        " on sairler.id = siirler.sair_id " +
        " order by random() limit ? ";

    var result = await dbClient.rawQuery(sql, [random]);

    return result;
  }

  Future<List> getAllSiirler() async {
    var dbClient = await db;
    var result = await dbClient.query(tableSiirler, columns: [
      columnId,
      columnBaslik,
      columnIcerik,
      columnSairID,
      columnIsFavorite
    ]);

    return result.toList();
  }

  Future<dynamic> getAllSiirlerBySairID(int sairID) async {
    //dynamic ten önce list yazılıydı hata veriyordu return kısmıda return result yazılıydı aşağıdaki gibi değiştirdim
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        'select siirler.id , $columnIsFavorite, $columnBaslik , $columnSairID , $columnIcerik , $columnAd , $columnSlug ' +
            ' from siirler ' +
            'left join sairler on sairler.id = siirler.sair_id ' +
            'where sair_id = ? order by $columnBaslik',
        [sairID]);

    return Future.value(result); //
  }

  String getIDSString(List<int> ids) {
    String str = "";

    for (int i = 0; i < ids.length; i++) {
      str += ids[i].toString();
      if (ids.length - 1 != i) {
        str += " , ";
      }
    }

    print(str);

    return str;
  }

  Future<List> getAllSiirlerByIDs(List<int> ids) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        'select siirler.id , $columnIsFavorite, $columnBaslik , $columnSairID , $columnIcerik , $columnAd , $columnSlug ' +
            ' from siirler ' +
            'left join sairler on sairler.id = siirler.sair_id ' +
            'where siirler.id in ( ' +
            getIDSString(ids) +
            ' ) order by $columnBaslik');

    return result;
  }

  Future<Siir> getSiir(int id) async {
    var dbClient = await db;
    var result = await dbClient.query(tableSiirler,
        columns: [
          columnId,
          columnBaslik,
          columnIcerik,
          columnSairID,
          columnIsFavorite,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return Siir.fromMap(result.first);
    }

    return null!;
  }

  Future<int?> getCountSair() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableSairler'));
  }

  Future<int> updateFavorite(int siirID) async {
    var dbClient = await db;
    return await dbClient.rawUpdate(
        'update $tableSiirler set $columnIsFavorite = ' +
            'case $columnIsFavorite when 1 then 0 else 1 end where $columnId = ?',
        [siirID]);
  }

  Future<Sair> getSair(int id) async {
    var dbClient = await db;
    var result = await dbClient.query(tableSairler,
        columns: [columnId, columnAd, columnSlug, columnBio],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return Sair.fromMap(result.first);
    }

    return null!;
  }

  Future<int> deleteSair(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableSairler, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateSair(Sair note) async {
    var dbClient = await db;
    return await dbClient.update(tableSairler, note.CevirMap(),
        where: "$columnId = ?", whereArgs: [note.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  Future<int> updateFavorites(List<String> lstFavorites) async {
    var dbClient = await db;
    String inString =
        lstFavorites.toString().replaceAll('[', '(').replaceAll(']', ')');

    return await dbClient.rawUpdate(
        'update $tableSiirler set $columnIsFavorite = ' +
            ' 1 where $columnId in $inString');
  }

  Future<int?> getIsFirstLogin() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT isFirstLogin FROM $tableSettings'));
  }

  Future<int> setIsFirstLogin(int value) async {
    var dbClient = await db;

    return await dbClient
        .rawUpdate('update $tableSettings set isFirstLogin = $value');
  }

  Future<int> setShowAds(int value) async {
    var dbClient = await db;

    return await dbClient
        .rawUpdate('update $tableSettings set $columnShowAds = $value');
  }

  Future<int> setSendDaily(int value) async {
    var dbClient = await db;

    return await dbClient
        .rawUpdate('update $tableSettings set $columnSendDaily = $value');
  }
}
