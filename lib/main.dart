// ignore_for_file: avoid_print
// (Los print() son obligatorios en la práctica: paso 7)

import 'package:flutter/material.dart';

// PASO 1: punto de entrada de la aplicación
void main() {
  runApp(const PracticaFlutter());
}

// PASO 4: pantalla convertida a StatefulWidget (cuerpo)
class PracticaFlutter extends StatefulWidget {
  const PracticaFlutter({super.key});

  @override
  State<PracticaFlutter> createState() => _PracticaFlutterState();
}

// Clase State (cerebro): estado + ciclo de vida
class _PracticaFlutterState extends State<PracticaFlutter> {
  // PASO 5: variable de estado con valor inicial 0
  int contador = 0;

  // PASO 7: se ejecuta UNA sola vez al iniciar el State
  @override
  void initState() {
    super.initState();
    print('>>> initState(): el State se creó e inicializó');
  }

  // PASO 6: incrementa el contador usando setState()
  void incrementar() {
    setState(() {
      contador++;
    });
  }

  // PASOS 2 y 3: Scaffold + AppBar, Column con Text y ElevatedButton
  // PASO 7: print() en cada (re)construcción
  @override
  Widget build(BuildContext context) {
    print('>>> build(): interfaz construida (contador = $contador)');
    return MaterialApp(
      title: 'Práctica Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Mi primera pantalla')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $contador'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: incrementar,
              child: const Text('Incrementar +'),
            ),
          ],
        ),
      ),
    );
  }

  // PASO 7: se ejecuta antes de eliminar el State
  @override
  void dispose() {
    print('>>> dispose(): el State se está eliminando');
    super.dispose();
  }
}
