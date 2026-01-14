import '../modeles/produit.dart';

class ArticlePanier {
  final Produit produit;
  int quantite;

  ArticlePanier({required this.produit, this.quantite = 1});
}

class ServicePanier {
  static final List<ArticlePanier> _articles = [];

  static List<ArticlePanier> get articles => List.unmodifiable(_articles);

  static void ajouterProduit(Produit produit, int quantite) {
    // Vérifier si le produit est déjà dans le panier
    for (var item in _articles) {
      if (item.produit.nom == produit.nom) {
        item.quantite += quantite;
        return;
      }
    }
    // Sinon, l'ajouter
    _articles.add(ArticlePanier(produit: produit, quantite: quantite));
  }

  static void supprimerArticle(ArticlePanier article) {
    _articles.removeWhere((item) => item.produit.nom == article.produit.nom);
  }

  static void viderPanier() {
    _articles.clear();
  }

  static double get total {
    return _articles.fold(0, (sum, item) => sum + (item.produit.prix * item.quantite));
  }

  static int get nombreArticles {
    return _articles.fold(0, (sum, item) => sum + item.quantite);
  }
}
