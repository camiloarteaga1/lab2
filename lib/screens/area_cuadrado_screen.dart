import 'package:flutter/material.dart';

class SquareArea extends StatefulWidget {

  const SquareArea({super.key});

  @override
  State<SquareArea> createState() => _SquareAreaState();

}

class _SquareAreaState extends State<SquareArea> {
  final TextEditingController _sideController = TextEditingController();
  double _area = 0;

  void _calculateArea() {
    double side = double.tryParse(_sideController.text.replaceAll(',', '.')) ?? 0;
    setState(() {
      _area = side * side;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(199, 236, 194, 5), //Color de la Barra
        title: const Text(
          "Área del cuadrado",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This navigates back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _sideController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese la longitud de uno de los lados",
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateArea,
              child: const Text("Calcular Área del cuadrado"),
            ),
            
            const SizedBox(height: 16),
            Text(
              "Área: $_area",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sideController.dispose();
    super.dispose();
  }
}
