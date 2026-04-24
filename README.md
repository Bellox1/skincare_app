# 🌿 Skincare App - Boutique Cosmétique Moderne (Flutter)

**Skincare App** est une application mobile élégante et intuitive dédiée à la vente de produits de soin de la peau. Ce projet met en avant une expérience utilisateur (UX) fluide, des animations soignées et une gestion d'état maîtrisée, illustrant parfaitement la puissance de **Flutter** pour le e-commerce.

---

## ✨ Points Forts de l'Expérience

*   **🎨 Design Épuré** : Une interface minimaliste et apaisante, alignée sur l'univers du soin et du bien-être.
*   **⚡ Navigation Fluide** : Utilisation intensive du widget `Hero` pour des transitions d'images spectaculaires entre la boutique et les détails du produit.
*   **🛒 Shopping Interactif** : Système de panier dynamique avec calcul en temps réel et confirmations visuelles (SnackBars).
*   **❤️ Liste de Souhaits** : Gestion intuitive des favoris pour une personnalisation de l'expérience utilisateur.

---

## 📸 Aperçu Visuel

![Aperçu de l'application](lib/assets/app.png)

---

## 🛠️ Architecture & Structure du Code

Le projet est organisé de manière modulaire pour garantir une maintenance aisée et une scalabilité optimale.

### 1. 📂 Core Logic (`lib/`)
*   **[main.dart](cci:7://file:///home/bellox/Documents/Stage/bellox1%20%28copie%29/Projets/X0/bin/main.dart:0:0-0:0)** : Point d'entrée orchestrant les routes et le thème global.
*   **`lancement.dart`** : Splash screen immersif avec appel à l'action.
*   **`boutique.dart`** : Hub principal avec filtrage dynamique (Women, Men, Kids) et grille de produits.
*   **`detail.dart`** : Fiche produit détaillée avec gestion des quantités et animations Hero.
*   **`panier.dart`** : Gestion des articles, calcul des totaux et processus de checkout simulé.
*   **`favoris.dart` & `profil.dart`** : Espaces personnalisés pour l'utilisateur.

### 2. 🏗️ Modèle de Données (`lib/modeles/`)
*   **`produit.dart`** : Contrat de données robuste définissant les propriétés d'un article.
*   **`donnees_fictives.dart`** : Mock data permettant de tester l'UI avec des scénarios réels.

### 3. 🧠 Services & State (`lib/services/`)
*   **`service_panier.dart`** : Logique métier du panier (ajout, suppression, calcul).
*   **`service_favoris.dart`** : Gestion centralisée de l'état des coups de cœur.

### 4. 🎨 Design System (`lib/widgets/`)
*   **`couleurs.dart`** : Charte graphique centralisée pour une cohérence visuelle parfaite.

---

## 🚀 Stack Technique

*   **Framework** : [Flutter](https://flutter.dev/) (Multi-plateforme)
*   **Langage** : [Dart](https://dart.dev/)
*   **Icons** : Cupertinos & Material Icons
*   **Animations** : Hero Animations & Transitions Custom

---

## 📦 Installation & Utilisation

1. **Prérequis** : Flutter SDK installé.
2. **Récupération** : 
   ```bash
   git clone https://github.com/votre-compte/skincare-app.git
