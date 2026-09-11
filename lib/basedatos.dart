import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'automovil.dart';
class DB{
  static Future<Database> _conexion() async{
    return openDatabase(
        join(await getDatabasesPath(),"ejemplo1.db"),
        version: 1,
        onCreate: (db,version){
          return db.execute("CREATE TABLE PERSONA(CURP TEXT PRIMARY KEY, NOMBRE TEXT, APELLIDOP TEXT, APELLIDOM INTEGER, EDAD INTEGER)");
        }
    );
  }
  static Future<int> insertar(Persona p) async{
    Database base = await _conexion();
    return base.insert("PERSONA", p.toJSON(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  static Future<int> eliminar(String placa) async{
    Database base = await _conexion();
    return base.delete("PERSONA", where: "CURP=?", whereArgs: [placa]);
  }

  static Future<List<Automovil>> mostrarTodos() async{
    Database base = await _conexion();
    List<Map<String, dynamic>> temp = await base.query("PERSONA");

    return List.generate(temp.length,
            (contador){
              return Automovil(
                  placa: temp[contador]['CURP'],
                  marca: temp[contador]['NOMBRE'],
                  modelo: temp[contador]['APELLIDOP'],
                  anio: temp[contador]['APELLIDOM'],
                  costo: temp[contador]['EDAD']
              );
            });
  }

  static Future<int> actualizar(Automovil a) async{
    Database base = await _conexion();
    return base.update("AUTOMOVIL", a.toJSON(),
                where: "PLACA=?", whereArgs: [a.placa]);
  }
}

