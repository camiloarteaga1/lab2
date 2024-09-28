import 'package:flutter/material.dart';

class PentagonPerimeter extends StatefulWidget {

  const PentagonPerimeter({super.key});

  @override
  State<PentagonPerimeter> createState() => _PentagonPerimeterState();

}

class _PentagonPerimeterState extends State<PentagonPerimeter> {
  final TextEditingController _sideController = TextEditingController();
  double _perimeter = 0;

  void _calculatePerimeter() {
    double side = double.tryParse(_sideController.text) ?? 0;
    setState(() {
      _perimeter = 5 * side;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(199, 236, 194, 5), //Color de la Barra
        title: const Text(
          "Perímetro Pentágono",
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
                labelText: "Ingrese la longitud del lado",
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculatePerimeter,
              child: const Text("Calcular Perímetro"),
            ),
            
            const SizedBox(height: 16),
            Text(
              "Perímetro: $_perimeter",
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
