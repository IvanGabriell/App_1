import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Importando a tela de splash

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      home: SplashScreen(), // Tela de Splash
    );
  }
}
