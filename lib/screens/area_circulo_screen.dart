import 'package:flutter/material.dart';
import 'dart:math';

class AreaCirculoPages extends StatefulWidget {
  const AreaCirculoPages({super.key});

  @override
  State<AreaCirculoPages> createState() => _AreaCirculoPagesState();
}

class _AreaCirculoPagesState extends State<AreaCirculoPages> {
  final _formKey = GlobalKey<FormState>();
  final _radio = TextEditingController();
  double _area = 0.0;

  void _calculoAreaCirculo() {
    if (_formKey.currentState!.validate()) {
      double radius = double.parse(_radio.text);
      setState(() {
        _area = pi * radius * radius;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: const Text(
          "Área del Circulo",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),
        )),
        leading: IconButton(
          icon: Icon(
            Icons.circle,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/circulo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: _radio,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(19.0))),
                      labelText: "Ingrese el radio",
                      //helperText: "*Campo Obligatorio",
                      prefixIcon: Icon(Icons.circle)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el radio';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingrese un número valido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: _calculoAreaCirculo,
                  child: const Text('Calcular'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text('$_area'),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _radio.dispose();
    super.dispose();
  }
}
