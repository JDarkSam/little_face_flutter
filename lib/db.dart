import 'package:little_face/infante.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> _openDB() async{
    return openDatabase(join(await getDatabasesPath(),'littleface.db'),
      onCreate: (db, version){
        return db.execute(
            "CREATE TABLE infantes (id Integer Primary Key, nombres TEXT, apellidos TEXT, edad Integer, alias TEXT)",
        );
      },
      version:1
    );
  }

  static Future<int> insert(Infante infante) async{
    Database database = await _openDB();

    return database.insert("infantes", infante.toMap());
  }

  static Future<int> delete(Infante infante) async {
    Database database = await _openDB();
    return database.delete("infantes",where: "id = ?", whereArgs:[infante.id]);
  }

  static Future<int> update(Infante infante) async {
    Database database = await _openDB();
    return database.update("infantes",infante.toMap(), where: "id = ?", whereArgs:[infante.id]);
  }

  static Future<List<Infante>> infantes() async{
    Database database = await _openDB();
    final List<Map<String, dynamic>> infantesMap = await database.query("infantes");

    return List.generate(infantesMap.length,
            (i) => Infante(
                id: infantesMap[i]['id'],
                nombres: infantesMap[i]['nombres'],
                apellidos: infantesMap[i]['apellidos'],
                edad: infantesMap[i]['edad'],
                alias: infantesMap[i]['alias']
            )
          );
  }

  //Con sentencias
  static Future<void> insetar2(Infante infante) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("insert into infantes (id, nombres, apellidos, edad, alias)"
    " values (${infante.id}, ${infante.nombres},${infante.apellidos},${infante.edad},${infante.alias} )");
  }

}

