// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../Page/register_clientes.dart';
import '../Page/productos_page.dart';

class NavAppbar extends StatelessWidget {
  final String title;
  const NavAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const RegisterCliente(), // va a la pagina de registro de clientes
              ),
            );
          },
          icon: const Icon(Icons.person_2_outlined),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage())); // va a la pagina de registro de productos
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
