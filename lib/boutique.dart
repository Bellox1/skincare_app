import 'package:flutter/material.dart';
import 'widgets/couleurs.dart';
import 'widgets/carte_produit.dart';
import 'modeles/donnees_fictives.dart';
import 'panier.dart';
import 'profil.dart';
import 'favoris.dart';
import 'services/service_favoris.dart';
import 'services/service_panier.dart';

class EcranBoutique extends StatefulWidget {
  const EcranBoutique({super.key});

  @override
  State<EcranBoutique> createState() => _EcranBoutiqueState();
}

class _EcranBoutiqueState extends State<EcranBoutique> {
  String categorieSelectionnee = "All";
  final List<String> categories = ["All", "Women", "Man", "Kids", "Pare"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CouleursApp.fondEcran,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Best Skincare',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EcranPanier()),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Bannière promotionnelle
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: CouleursApp.vertPrimaire,
                borderRadius: BorderRadius.circular(25),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Collection for\nDelicate skin',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.3),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                          ),
                          child: const Text('Shop Now'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    top: 0,
                    child: Image.asset(
                      'lib/assets/haut.png',
                      width: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Section Collections
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Collections',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Liste des catégories
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool estSelectionne = categories[index] == categorieSelectionnee;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        categorieSelectionnee = categories[index];
                      });
                    },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: estSelectionne ? CouleursApp.vertPrimaire : Colors.grey.shade300,
                            width: estSelectionne ? 2 : 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: estSelectionne ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            // Grille de produits
            Builder(
              builder: (context) {
                final produitsFiltres = listeProduits.where((p) => categorieSelectionnee == "All" || p.categorie.trim().toLowerCase() == categorieSelectionnee.trim().toLowerCase()).toList();

                // Trier pour mettre les favoris en premier
                produitsFiltres.sort((a, b) {
                  bool aEstFavori = ServiceFavoris.estFavori(a);
                  bool bEstFavori = ServiceFavoris.estFavori(b);
                  if (aEstFavori && !bEstFavori) return -1;
                  if (!aEstFavori && bEstFavori) return 1;
                  return 0;
                });

                if (produitsFiltres.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "No products found",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: produitsFiltres.length,
                  itemBuilder: (context, index) {
                    return CarteProduit(
                      produit: produitsFiltres[index],
                      onFavoriteChanged: () {
                        setState(() {});
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNavItem(Icons.home_filled, true, () {}),
                  const SizedBox(width: 15),
                  _buildNavItem(Icons.favorite_border, false, () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EcranFavoris()),
                    );
                    if (mounted) setState(() {});
                  }),
                  const SizedBox(width: 15),
                  _buildNavItem(Icons.shopping_bag_outlined, false, () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EcranPanier()),
                    );
                    if (mounted) setState(() {});
                  }),
                  const SizedBox(width: 15),
                  _buildNavItem(Icons.person_outline, false, () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EcranProfil()),
                    );
                    if (mounted) setState(() {});
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? CouleursApp.vertPrimaire : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
