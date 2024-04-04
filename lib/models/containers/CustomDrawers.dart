import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatelessWidget {
  final bool isDark;
  final VoidCallback onHomeTap;
  final VoidCallback onAccountsUnlockedTap;
  final VoidCallback onNotificationCenterTap;
  final VoidCallback onSettingsTap;

  const CustomDrawerMenu({
    Key? key,
    required this.isDark,
    required this.onHomeTap,
    required this.onAccountsUnlockedTap,
    required this.onNotificationCenterTap,
    required this.onSettingsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = isDark ? 'assets/images/logo_Roselia_no_bg.png' : 'assets/images/logo_Roselia_no_bg.png';
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.7,
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: isDark ? Colors.white : Colors.black),
              title: Text('Home', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              onTap: onHomeTap,
            ),
            ListTile(
              leading: Icon(Icons.lock_open, color: isDark ? Colors.white : Colors.black),
              title: Text('Accounts Unlocked', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              onTap: onAccountsUnlockedTap,
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: isDark ? Colors.white : Colors.black),
              title: Text('Notification center', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              onTap: onNotificationCenterTap,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: isDark ? Colors.white : Colors.black),
              title: Text('Settings', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              onTap: onSettingsTap,
            ),
          ],
        ),
      ),
    );
  }
}
