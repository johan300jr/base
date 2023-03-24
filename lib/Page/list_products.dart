import 'package:flutter/material.dart';

import '../Appbar/Nav_Appbar.dart';
import '../Model/productos_model.dart';

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key});

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  List<Productos> productos = [];

  @override
  void initState() {
    loadProductos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: NavAppbar(title: 'Lista Productos'),
      ),
      body: ListView.separated(
        itemCount: productos.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(productos[index].id!.toString()),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) async {
              await Productos.deleteProductos(productos[index].id!);
              setState(() {
                productos.removeAt(index);
              });
            },
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productos[index].name),
                  Text(
                      'Productos: ${productos[index].precio}'), // AQUI HAY UN ERROR
                ],
              ),
              subtitle: Text(
                  'Cantidad: ${productos[index].cantidad}'), // AQUI HAY UN ERROR
            ),
          );
        },
      ),
    );
  }

  void loadProductos() async {
    final productsList = await Productos.getProductos();
    setState(() {
      productos = productsList;
    });
  }
}
