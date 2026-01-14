import 'package:flutter/material.dart';
import 'widgets/couleurs.dart';
import 'widgets/carte_produit.dart';
import 'modeles/donnees_fictives.dart';
import 'services/service_favoris.dart';

class EcranFavoris extends StatefulWidget {
  const EcranFavoris({super.key});

  @override
  State<EcranFavoris> createState() => _EcranFavorisState();
}

class _EcranFavorisState extends State<EcranFavoris> {
  @override
  Widget build(BuildContext context) {
    final favoris = ServiceFavoris.getListeFavoris(listeProduits);

    return Scaffold(
      backgroundColor: CouleursApp.fondEcran,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Mes Favoris',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: favoris.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 20),
                  const Text(
                    'Aucun favori pour le moment',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: favoris.length,
              itemBuilder: (context, index) {
                return CarteProduit(
                  produit: favoris[index],
                  onFavoriteChanged: () {
                    setState(() {});
                  },
                );
              },
            ),
    );
  }
}
