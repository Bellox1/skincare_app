import '../modeles/produit.dart';

class ServiceFavoris {
  static final Set<String> _favorisIds = {};

  static bool estFavori(Produit produit) {
    return _favorisIds.contains(produit.nom);
  }

  static void basculerFavori(Produit produit) {
    if (_favorisIds.contains(produit.nom)) {
      _favorisIds.remove(produit.nom);
    } else {
      _favorisIds.add(produit.nom);
    }
  }

  static List<Produit> getListeFavoris(List<Produit> tousLesProduits) {
    return tousLesProduits.where((p) => _favorisIds.contains(p.nom)).toList();
  }
}
