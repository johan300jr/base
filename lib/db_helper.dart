import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();

  DbHelper._instance();

  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

// nal String name;
//   final double precio;
//   final int cantidad;
//   final String estado;
  static Future<Database> initDb() async {
    final db = openDatabase(
      join(await getDatabasesPath(), 'clientesdb.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE clientes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, apellido TEXT, correo TEXT, telefono INTEGER,direccion TEXT,estado TEXT)',
        );
        db.execute(
          'CREATE TABLE productos(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, precio REAL, cantidad INTENGER, estado TEXT)',
        );
      },
      version: 1,
    );
    return db;
  }
}
