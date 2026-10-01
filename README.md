# Práctica Flutter – Contador con StatefulWidget

Práctica de la guía **"Introducción a Flutter"** (IESTPFFAA).
Pantalla con `Scaffold` y `AppBar`, contador con `setState()`, registro del
ciclo de vida (`initState()`, `build()`, `dispose()`) y comparación entre
**Hot Reload** y **Hot Restart**.

**Autor:** Antony Sedano Calderón — `sedanocalderonantony04`

---

## Requisitos

- Flutter SDK (canal estable)
- VS Code o Android Studio
- Dispositivo: Chrome, Edge, Windows o emulador Android

## Ejecutar el proyecto

```bash
flutter pub get
flutter run
```

Con la app corriendo:
- `r` → Hot Reload
- `R` → Hot Restart
- `q` → Salir

## Estructura relevante

```
practica_flutter/
├── lib/
│   └── main.dart        ← Código principal (pasos 1–7)
├── test/
│   └── widget_test.dart ← Prueba automatizada del contador
└── pubspec.yaml         ← Dependencias y configuración
```

## Pasos de la práctica (cumplidos)

1. ✅ Ubicar `lib/main.dart` e identificar `main()`.
2. ✅ Pantalla con `Scaffold` y `AppBar`.
3. ✅ `Column` con `Text` y `ElevatedButton`.
4. ✅ Pantalla convertida a `StatefulWidget` (`createState()` + `_PracticaFlutterState`).
5. ✅ Variable `int contador = 0;`.
6. ✅ Incremento con `setState(() { contador++; });`.
7. ✅ `print()` en `initState()`, `build()` y `dispose()`.
8. ✅ Hot Reload ejecutado: el contador **conserva** su valor.
9. ✅ Hot Restart ejecutado: el contador **vuelve a 0**.

## Código principal (`lib/main.dart`)

```dart
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

void main() {
  runApp(const PracticaFlutter());
}

class PracticaFlutter extends StatefulWidget {
  const PracticaFlutter({super.key});

  @override
  State<PracticaFlutter> createState() => _PracticaFlutterState();
}

class _PracticaFlutterState extends State<PracticaFlutter> {
  int contador = 0;

  @override
  void initState() {
    super.initState();
    print('>>> initState(): el State se creó e inicializó');
  }

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('>>> build(): interfaz construida (contador = $contador)');
    return MaterialApp(
      title: 'Práctica Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi primera pantalla'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $contador'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: incrementar,
              child: const Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('>>> dispose(): el State se está eliminando');
    super.dispose();
  }
}
```

## Prueba automatizada

```bash
flutter test
```
Resultado esperado: `All tests passed!`

## Hot Reload vs Hot Restart (diferencia observada)

| Aspecto | Hot Reload (`r`) | Hot Restart (`R`) |
|---|---|---|
| Contador | Se conserva | Vuelve a 0 |
| `main()` | No se repite | Se repite |
| `initState()` | No se repite | Se repite |
| `build()` | Se repite | Se repite |
| `dispose()` | No se ejecuta | Puede ejecutarse al descartar el State |

**Conclusión:** Hot Reload aplicó el cambio visual conservando el estado
(contador sin reiniciarse), reconstruyendo solo la interfaz (`build()`).
Hot Restart reinició la aplicación por completo: el contador retornó a 0 y se
ejecutaron nuevamente `main()`, `initState()` y `build()`, observándose el
`dispose()` del estado anterior.