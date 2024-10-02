import 'package:flutter/material.dart';
import 'package:lab1/screens/area_circulo_screen.dart';
// import 'package:lab1/screens/perimetro_circulo_screen.dart';
import 'package:lab1/screens/area_cuadrado_screen.dart';
// import 'package:lab1/screens/perimetro_cuadrado_screen.dart';
// import 'package:lab1/screens/area_triangulo_screen.dart';
// import 'package:lab1/screens/perimetro_triangulo_screen.dart';
// import 'package:lab1/screens/area_pentagono_screen.dart';
import 'package:lab1/screens/per_penta_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            top: 9.0, 
            bottom: 9.0,
          ),
          // child: Image(
          //   image: AssetImage('assets/icons/logo.png'),
          // ),
        ),
        backgroundColor: const Color.fromARGB(170, 29, 112, 108),
        title: const Text(
          'Lab 2',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Broadway',
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
        children: <Widget>[
         const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(  // Center the title text
              child: Text(
                'Elija una de las funciones',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Creates a grid layout with 2 columns and 2 rows
              padding: const EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[

              // Image 1
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PentagonPerimeter()),
                  );
                },
                child: const Column(
                  children: [
                    Expanded(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage('assets/images/peri_pentagono.png')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Perímetro de un pentágono'),
                    ),
                  ],
                ),
              ),
              
              // // Image 2
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SquareArea()),
                  );
                },
                child: const Column(
                  children: [
                    Expanded(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage('assets/images/area_cuadrado.png')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Área del cuadrado'),
                    ),
                  ],
                ),
              ),

              // Image 3
               GestureDetector(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const AreaCirculoPages()),
                   );
                 },
                 child: const Column(
                   children: [
                     Expanded(
                       child: Image(
                         height: 200,
                         width: 200,
                         image: AssetImage('assets/images/area_circulo.png')
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(top: 8.0),
                       child: Text('Área del círculo'),
                     ),
                   ],
                 ),
               ),
                // Image 4
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PerCircScreen()),
                    );
                  },
                  child: const Column(
                    children: [
                      Expanded(
                        child: Image(
                            height: 200,
                            width: 200,
                            image: AssetImage('assets/images/peri_circulo.png')
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Perímetro del círculo'),
                      ),
                    ],
                  ),
                ),
              // // Image 4
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const ResistorScreen()),
              //     );
              //   },
              //   child: const Column(
              //     children: [
              //       Expanded(
              //         child: Image(
              //           height: 200,
              //           width: 200,
              //           image: AssetImage('assets/images/resistor.png')
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(top: 8.0),
              //         child: Text('Calculadora de resistencias'),
              //       ),
              //     ],
              //   ),
              // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}