import 'package:sqflite/sqflite.dart';

import '../db_helper.dart';

class Clientes {
  final int? id;
  final String name;
  final String apellido;
  final String correo;
  final int telefono;
  final String direccion;
  final String estado;

  const Clientes(
      {this.id,
      required this.name,
      required this.apellido,
      required this.correo,
      required this.telefono,
      required this.direccion,
      this.estado = "true"});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'apellido': apellido,
      'correo': correo,
      'telefono': telefono,
      'direccion': direccion,
      'estado': estado
    };
  }

  @override
  String toString() {
    return 'Clientes{id: $id, name: $name,apellido: $apellido, telefono: $telefono}, estado: $estado';
  }

  static Future<List<Clientes>> getClientes() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('clientes');
    return List.generate(maps.length, (i) {
      return Clientes(
        id: maps[i]['id'],
        name: maps[i]['name'],
        apellido: maps[i]['apellido'],
        correo: maps[i]['correo'],
        telefono: maps[i]['telefono'],
        direccion: maps[i]['direccion'],
        estado: maps[i]['estado'],
      );
    });
  }

  static Future<int> insertClientes(Clientes clientes) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('clientes', clientes.toMap());
    return result;
  }

  static Future<int> updateClientes(Clientes clientes) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'Clientes',
      clientes.toMap(),
      where: 'id = ?',
      whereArgs: [clientes.id],
    );
  }

  static Future<int> deleteClientes(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'Clientes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
