import 'package:flutter/material.dart';
class PerCuadradoScreen extends StatefulWidget {
  const PerCuadradoScreen({super.key});

  @override
  State<PerCuadradoScreen> createState() => _CircleAreaPageState();
}

class _CircleAreaPageState extends State<PerCuadradoScreen> {

  final _lado = TextEditingController();
  double _perimetro = 0;
  bool _verification = true;
  String _mensaje = "";

  void _perimetroDelCuadrado(){
    setState(() {
      _dataVerification();
      if (_verification == true) {
        _perimetro = double.parse((double.parse(_lado.text) * 4).toStringAsFixed(2));
        _mensaje = "El perimetro del cuadrado con lado L = ${_lado.text} es ${_perimetro}";
      }
      else{_mensaje="";}
    });
  }

  void _dataVerification() {
    setState(() {
      if (double.tryParse(_lado.text) == null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Ingresar un valor numerico"),
            backgroundColor: Colors.red,
          ),
        );
        _verification=false;
      }
      else if (double.parse(_lado.text) < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Ingresar valores positivos"),
            backgroundColor: Colors.red,

          ),
        );
        _verification=false;
      }
      else {
        _verification=true;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          AppBar(
            title: FittedBox(
              fit: BoxFit.scaleDown, // Se ajusta al tamaño disponible sin sobrepasar el límite
              child: Text(
                "Perímetro del cuadrado",
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.black,
            shadowColor: Colors.blue,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _lado,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ingrese el lado del cuadrado",
                helperText: "*Campo obligatorio",
                prefixIcon: Icon(Icons.square_outlined)),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              _perimetroDelCuadrado();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Fondo negro
              foregroundColor: Colors.white, // Texto blanco
            ),
            child: Text('calcular perimetro'),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              _mensaje
          ),
          SizedBox(
            height: 16,
          ),
        ],

      ),
    );
  }
}