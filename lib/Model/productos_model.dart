import 'package:sqflite/sqflite.dart';

import '../db_helper.dart';

class Productos {
  final int? id;
  final String name;
  final double precio;
  final int cantidad;
  final String estado;

  const Productos(
      {this.id,
      required this.name,
      required this.precio,
      required this.cantidad,
      this.estado = "true"});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'precio': precio,
      'cantidad': cantidad,
      'estado': estado
    };
  }

  @override
  String toString() {
    return 'Productos{id: $id, name: $name, precio: $precio, cantidad: $cantidad}, estado: $estado';
  }

  static Future<List<Productos>> getProductos() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('productos');
    return List.generate(maps.length, (i) {
      return Productos(
        id: maps[i]['id'],
        name: maps[i]['name'],
        precio: maps[i]['precio'],
        cantidad: maps[i]['cantidad'],
        estado: maps[i]['estado'],
      );
    });
  }

  static Future<int> insertProductos(Productos productos) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('productos', productos.toMap());
    return result;
  }

  static Future<int> updateProductos(Productos productos) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'productos',
      productos.toMap(),
      where: 'id = ?',
      whereArgs: [productos.id],
    );
  }

  static Future<int> deleteProductos(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'Productos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
