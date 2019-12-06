import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;


///
///
class Provider {
  static Database db;
  //初始化数据库
  //在app启动的时候调用
  Future init() async {
    //获取本地SqlLite数据库
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'flutter.db');
    try {
      //打开数据库
      db = await openDatabase(path);
    } catch (e) {
      print("Error $e");
    }

    bool tableIsExits = await this.checkTableExits();
    if(tableIsExits){
      return;
    }
    /// 关闭上面打开的db，否则无法执行open
    db.close();
    // Delete the database
    await deleteDatabase(path);
    ByteData data = await rootBundle.load(join("assets", "loginDB.db"));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);
    ///创建数据库
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          print('db created version is $version');
        }, onOpen: (Database db) async {
          print('new db opened');
        });
  }


  // 检查数据库中, 表是否完整, 在部份android中, 会出现表丢失的情况
  Future checkTableExits() async {
    List<String> expectTables = ['userInfo'];

    List<String> tables = await getTables();

    for(int i = 0; i < expectTables.length; i++) {
      if (!tables.contains(expectTables[i])) {
        return false;
      }
    }
    return true;

  }

  /// 获取数据库中所有的表
  Future<List> getTables() async {
    if (db == null) {
      return Future.value([]);
    }
    List tables = await db.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    List<String> targetList = [];
    tables.forEach((item)  {
      targetList.add(item['name']);
    });
    return targetList;
  }

  Future close() async => db.close();
}

