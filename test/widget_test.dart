import 'package:flutter/material.dart'; // ← corrige el error de ElevatedButton
import 'package:flutter_test/flutter_test.dart';
import 'package:practica_flutter/main.dart';

void main() {
  testWidgets('El contador inicia en 0 y aumenta al pulsar el botón', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PracticaFlutter());

    // El contador inicia en 0
    expect(find.text('Contador: 0'), findsOneWidget);

    // Pulsamos el botón y reconstruimos
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // El contador ahora vale 1
    expect(find.text('Contador: 1'), findsOneWidget);
  });
}
