import 'package:flutter/material.dart';

import '../Appbar/Nav_Appbar.dart';
import 'list_clientes_page.dart';
import '../Model/clientes_model.dart';

class RegisterCliente extends StatefulWidget {
  const RegisterCliente({super.key});

  @override
  State<RegisterCliente> createState() => _RegisterClienteState();
}

class _RegisterClienteState extends State<RegisterCliente> {
  final _formKey = GlobalKey<FormState>();

  // declaracion de variables
  final _ctrlName = TextEditingController();
  final _ctrlApellido = TextEditingController();
  final _ctrlGmail = TextEditingController();
  final _ctrlTelefono = TextEditingController();
  final _ctrlDireccion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: NavAppbar(title: 'Regitral Cliemte'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Registro cliente',
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
                          decoration:
                              const InputDecoration(label: Text('Nombre')),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa un nombre';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _ctrlApellido,
                          decoration:
                              const InputDecoration(label: Text('Apellido')),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa un apellido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _ctrlGmail,
                          decoration:
                              const InputDecoration(label: Text('Gmail')),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa un gmail';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _ctrlTelefono,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(label: Text('Telefono')),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa un telefono';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _ctrlDireccion,
                          decoration: const InputDecoration(
                            label: Text('Direccion'),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa un Direccion';
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
                                const SnackBar(
                                    content: Text('Registro exitoso')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ListClientesPage(),
                                ),
                              );
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
        ),
      ),
    );
  }

  void submit() async {
    final name = _ctrlName.text;
    final apellido = _ctrlApellido.text;
    final gmail = _ctrlGmail.text;
    final telefono = _ctrlTelefono.text;
    final direccion = _ctrlDireccion.text;

    Clientes cliente = Clientes(
        name: name,
        apellido: apellido,
        correo: gmail,
        telefono: int.parse(telefono),
        direccion: direccion);
    await Clientes.insertClientes(cliente);
  }
}
