import 'package:flutter/material.dart';

import '../Appbar/Nav_Appbar.dart';
import '../Model/productos_model.dart';
import 'list_products.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlPrecio = TextEditingController();
  final _ctrlCantidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: NavAppbar(title: 'Registrar Productos'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Registro producto',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 68, 67, 67)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _ctrlName,
                      decoration: const InputDecoration(label: Text('Nombre')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa un nombre';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _ctrlPrecio,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(label: Text('Precio')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa un precio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _ctrlCantidad,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(label: Text('Cantidad')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa una cantidad';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          submit();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registro exitoso')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListProductPage()));
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void submit() async {
    final name = _ctrlName.text;
    final precio = _ctrlPrecio.text;
    final cantidad = _ctrlCantidad.text;

    Productos productos = Productos(
        name: name,
        precio: double.parse(precio),
        cantidad: int.parse(cantidad));
    await Productos.insertProductos(productos);
  }
}
