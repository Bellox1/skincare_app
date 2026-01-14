import 'package:flutter/material.dart';
import '../modeles/produit.dart';
import 'couleurs.dart';
import '../detail.dart';
import '../services/service_favoris.dart';

class CarteProduit extends StatefulWidget {
  final Produit produit;
  final VoidCallback? onFavoriteChanged;

  const CarteProduit({super.key, required this.produit, this.onFavoriteChanged});

  @override
  State<CarteProduit> createState() => _CarteProduitState();
}

class _CarteProduitState extends State<CarteProduit> {
  @override
  Widget build(BuildContext context) {
    bool estFavori = ServiceFavoris.estFavori(widget.produit);

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcranDetail(produit: widget.produit),
          ),
        );
        // Refresh when coming back from detail page
        if (mounted) {
          setState(() {});
          widget.onFavoriteChanged?.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      widget.produit.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ServiceFavoris.basculerFavori(widget.produit);
                        });
                        widget.onFavoriteChanged?.call();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          estFavori ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: estFavori ? CouleursApp.vertPrimaire : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.produit.nom,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${widget.produit.prix.toInt()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
