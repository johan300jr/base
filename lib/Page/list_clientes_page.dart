import 'package:flutter/material.dart';

import '../Appbar/Nav_Appbar.dart';
import '../Model/clientes_model.dart';

class ListClientesPage extends StatefulWidget {
  const ListClientesPage({super.key});

  @override
  State<ListClientesPage> createState() => _ListClientesPageState();
}

class _ListClientesPageState extends State<ListClientesPage> {
  List<Clientes> cliente = [];
  @override
  void initState() {
    loadClientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: NavAppbar(title: 'Lista Clientes'),
        ),
        body: ListView.separated(
          itemCount: cliente.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(cliente[index].id!.toString()),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) async {
                await Clientes.deleteClientes(cliente[index].id!);
                setState(() {
                  cliente.removeAt(index);
                });
              },
              child: ListTile(
                title: Text(cliente[index].name),
                subtitle: Text(cliente[index].apellido),
              ),
            );
          },
        ),
      ),
    );
  }

  void loadClientes() async {
    final clientesList = await Clientes.getClientes();
    setState(() {
      cliente = clientesList;
    });
  }
}
