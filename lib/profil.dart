import 'package:flutter/material.dart';
import 'widgets/couleurs.dart';

class EcranProfil extends StatelessWidget {
  const EcranProfil({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Mon Profil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Avatar et Nom
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/moi.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, size: 60, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Mationou BELLO',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'mantinoubello123@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),

            // Menu Options
            _buildMenuOption(
              icon: Icons.shopping_bag_outlined,
              title: 'Mes Commandes',
              onTap: () {},
            ),
            _buildMenuOption(
              icon: Icons.person_outline,
              title: 'Informations Personnelles',
              onTap: () {},
            ),
            _buildMenuOption(
              icon: Icons.credit_card_outlined,
              title: 'Moyens de Paiement',
              onTap: () {},
            ),
            _buildMenuOption(
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              onTap: () {},
              isLast: true, // Pour gérer le dernier élément du groupe "Compte" si voulu
            ),

            const SizedBox(height: 25),
            
            // Settings / Logout
             _buildMenuOption(
              icon: Icons.settings_outlined,
              title: 'Paramètres',
              onTap: () {},
            ),
            _buildMenuOption(
              icon: Icons.help_outline,
              title: 'Aide & Support',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            _buildMenuOption(
              icon: Icons.logout,
              title: 'Se déconnecter',
              textColor: Colors.redAccent,
              iconColor: Colors.redAccent,
              onTap: () {
                // Logique de déconnexion
              },
              hideArrow: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black,
    Color iconColor = Colors.black87,
    bool hideArrow = false,
    bool isLast = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: CouleursApp.vertPrimaire.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor,
            fontSize: 16,
          ),
        ),
        trailing: hideArrow
            ? null
            : Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
      ),
    );
  }
}
