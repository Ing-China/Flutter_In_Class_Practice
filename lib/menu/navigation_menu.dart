import 'package:flutter/material.dart';
import 'package:flutter_appd106d1/app_colors.dart';
import 'package:flutter_appd106d1/menu/about_us.dart';
import 'package:flutter_appd106d1/menu/check_password.dart';
import 'package:flutter_appd106d1/menu/contact_us.dart';
import 'package:flutter_appd106d1/menu/user_profile.dart';
import 'package:flutter_appd106d1/screens/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  Future<void> _logout() async {
    final sp = await SharedPreferences.getInstance();
    await sp.clear();
    // go to login 
    if(!mounted) return;
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => const LoginUser(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Azula'),
            accountEmail: const Text('azula@sr.bbu.edu.kh'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/azula.jpg'),
              ),
            ),
            decoration: const BoxDecoration(color: AppColors.mainColor),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_in_talk),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactUs(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Promotions'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('FAQs'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Feedback'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Terms of Use'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Invite Friends'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.password),
            title: const Text('Change Password'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckPassword(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              _logout();
            },
          ),
        ],
      ),
    );
  }
}
