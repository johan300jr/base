import 'package:flutter/material.dart';

import '../Appbar/Nav_Appbar.dart';
import 'list_clientes_page.dart';
import 'list_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromARGB(64, 26, 25, 25),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: NavAppbar(title: 'Inicio'),
        ),
        drawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 205, 213, 219),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListClientesPage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.person,
                            size: 50,
                            color: Color.fromARGB(255, 198, 43, 77),
                          ),
                        ),
                      ),
                      const Text('Clientes', style: TextStyle(fontSize: 18))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 205, 213, 219),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListProductPage()));
                          },
                          icon: const Icon(
                            Icons.add_business_outlined,
                            size: 50,
                            color: Color.fromARGB(255, 224, 106, 206),
                          ),
                        ),
                      ),
                      const Text('Productos', style: TextStyle(fontSize: 18))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
