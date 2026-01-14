import 'package:flutter/material.dart';
import 'lancement.dart';
import 'widgets/couleurs.dart';

void main() {
  runApp(const MonAppSkincare());
}

class MonAppSkincare extends StatelessWidget {
  const MonAppSkincare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'L3AL Skincare',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CouleursApp.vertPrimaire,
        fontFamily: 'Outfit', // Si vous avez ajouté la police, sinon utilise la police par défaut
        colorScheme: ColorScheme.fromSeed(
          seedColor: CouleursApp.vertPrimaire,
          primary: CouleursApp.vertPrimaire,
        ),
        useMaterial3: true,
      ),
      // Point d'entrée de l'application
      home: const EcranLancement(),
    );
  }
}
