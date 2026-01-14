# Projet Flutter - Skincare App

# Description du Projet
Ce projet consiste en la réalisation des interfaces principales d'une application de vente de produits cosmétiques. L'objectif était de mettre en pratique les concepts de base de **Flutter** : construction d'interfaces (Widgets), navigation, et gestion d'état simple.

<img src="lib/assets/app.png" alt="Aperçu de l'application" width="1000%" />

# Structure du Code (Fichier par Fichier)

Voici le détail du travail réalisé dans chaque fichier du dossier `lib/` :

## 1. Racine (`lib/`)

*   **`main.dart`** :
    *   Point d'entrée de l'application (`void main`).
    *   Configuration du `MaterialApp` et définition des routes principales.
    *   Lance l'écran de démarrage (`EcranLancement`).

*   **`lancement.dart`** :
    *   Correspond à l'écran de démarrage (Splash Screen).
    *   Affiche une image de fond et un bouton "Go" pour entrer dans la boutique.

*   **`boutique.dart`** :
    *   **Écran d'accueil** de l'application.
    *   Affiche une barre de recherche fictive.
    *   Implémente une **AppBar personnalisée** avec icône de menu et photo de profil.
    *   Affiche les produits sous forme de grille (`GridView`) avec filtrage par onglets (Women, Men, Kids).

*   **`detail.dart`** :
    *   **Page de détail** lorsqu'on clique sur un produit.
    *   Utilisation du widget `Hero` pour une animation fluide de l'image depuis la liste.
    *   Permet de sélectionner la quantité.
    *   **Logique d'ajout au panier** : Affiche un message de confirmation (SnackBar) flottant en noir.
    *   **Bouton Favori** : Permet de liker/disliker le produit.

*   **`panier.dart`** :
    *   Affiche la liste des produits ajoutés.
    *   **Fonctionnalités** :
        *   Affichage dynamique du total.
        *   Suppression d'un article via un bouton dédié (design arrondi gris).
        *   Vérification si le panier est vide (affichage d'un message spécifique le cas échéant).
    *   **Bouton "Checkout"** : Simule la commande, vide la liste des articles et affiche un message de succès.

*   **`profil.dart`** :
    *   Interface visuelle du profil utilisateur.
    *   Mise en page avec photo de profil, informations personnelles et liste d'options (Mes commandes, Paramètres, etc.).

*   **`favoris.dart`** :
    *   Écran listant uniquement les produits marqués comme "favoris" par l'utilisateur.

## 2. Dossier `lib/modeles/`

*   **`produit.dart`** :
    *   Définit la classe `Produit` avec ses attributs (image, nom, prix, description, taille, catégorie).
*   **`donnees_fictives.dart`** :
    *   Contient une liste statique de produits pour peupler l'application sans base de données externe.

## 3. Dossier `lib/services/`

Ces fichiers gèrent la logique des données (État de l'application) accessible partout :

*   **`service_panier.dart`** :
    *   Stocke la liste des articles sélectionnés en mémoire.
    *   Contient les méthodes `ajouterProduit`, `supprimerArticle`, `viderPanier` et le calcul du `total`.
*   **`service_favoris.dart`** :
    *   Gère la liste des produits préférés (ajout/retrait).

## 4. Dossier `lib/widgets/`

*   **`couleurs.dart`** :
    *   Fichier centralisant les constantes de couleurs (ex: Vert Primaire) pour garder une cohérence graphique.