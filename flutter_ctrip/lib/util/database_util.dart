import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String sql_createAccountTable =
    "create table account_table(id integer primary key, username text not null, password text not null)";

class DatabaseUtil {
  static DatabaseUtil _instance = DatabaseUtil._init();
  String dbName = "test.db";
  String dbPath = "";
  factory DatabaseUtil() {
    return _instance;
  }
  DatabaseUtil._init() {}

  Future<String> _createNewDb(String dbName) async {
    var dbPath = await getDatabasesPath();
    print("DBPath:" + dbPath);

    String path = join(dbPath, dbName);
    if (await new Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await new Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  _create() async {
    dbPath = await _createNewDb(dbName);
    Database db = await openDatabase(dbPath);
    await db.execute(sql_createAccountTable);
    await db.close();
    print("创建数据库成功");
  }

  _open() async {
    if (null == dbPath) {
      var path = await getDatabasesPath();
      dbPath = join(path, dbName);
      print('dbPath:' + dbPath);
    }

    return await openDatabase(dbPath);
  }

  _add(String username, String password) async {
    Database db = await _open();
    String sql =
        "insert into account_table(username,password) values('$username', '$password')";
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });
    await db.close();
    print('插入数据成功');
  }

  _delete(Map info) async {
    var id = info["id"];
    Database db = await _open();
    String sql = "DELETE FROM account_table where id = $id";
    await db.rawDelete(sql);
    await db.close();
    print('删除数据成功');
  }

//查询数据数目
  _queryNumber() async {
    Database db = await _open();
    int count = Sqflite.firstIntValue(
        await db.rawQuery("select COUNT(*) from account_table"));
    await db.close();
    print("查询数据成功 $count");
  }

//查询所有数据
  Future<List> _query() async {
    Database db = await _open();
    List<Map> list = await db.rawQuery("select * from account_table");
    await db.close();
    print(list);
    return list;
  }

  _batch() async {
    Database db = await _open();
    var batch = db.batch();
    batch.insert("account_table", {"username": "123450002", "password": "111"});
    batch.update("account_table", {"username": "123450003"},
        where: "username=?", whereArgs: ["123450002"]);
    batch
        .delete("account_table", where: "username=?", whereArgs: ["123450001"]);
    var results = await batch.commit();
    await db.close();
    print('批量修改成功');
  }
}
