import 'package:flutter/material.dart';

class PerimetroTrianguloScreen extends StatefulWidget {
  const PerimetroTrianguloScreen({super.key});

  @override
  State<PerimetroTrianguloScreen> createState() => _PerimetroTrianguloScreenState();
}

class _PerimetroTrianguloScreenState extends State<PerimetroTrianguloScreen> {
  // Controladores para los campos de texto
  final TextEditingController _ladoAController = TextEditingController();
  final TextEditingController _ladoBController = TextEditingController();
  final TextEditingController _ladoCController = TextEditingController();

  double _perimetro = 0;

  // Función para calcular el perímetro
  void _calcularPerimetro() {
    final double ladoA = double.tryParse(_ladoAController.text) ?? 0;
    final double ladoB = double.tryParse(_ladoBController.text) ?? 0;
    final double ladoC = double.tryParse(_ladoCController.text) ?? 0;

    if (ladoA > 0 && ladoB > 0 && ladoC > 0) {
      setState(() {
        _perimetro = ladoA + ladoB + ladoC;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perímetro del Triángulo'),
        // Color amarillo más oscuro para el AppBar
        backgroundColor: Colors.yellow[700],
      ),
      // Color de fondo amarillo claro
      backgroundColor: Colors.yellow[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ladoAController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Lado A'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ladoBController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Lado B'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ladoCController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Lado C'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPerimetro,
              child: const Text('Calcular Perímetro'),
            ),
            const SizedBox(height: 20),
            Text(
              'Perímetro: $_perimetro',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
