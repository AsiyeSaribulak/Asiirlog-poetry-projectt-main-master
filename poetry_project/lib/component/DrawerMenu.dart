import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_project/sayfalar/Anasayfa.dart';

import '../Wİdget/SairList.dart';

import '../sayfalar/Favoriler.dart';
import '../sayfalar/Profil.dart';
import '../sayfalar/SiirDepoSayfa.dart';
import '../sayfalar/login.dart';
import '../secreen/GirisEkrani.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Drawer Example'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(),
      ),
      drawer: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/baykusPng.png',
                    ),
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.home,
                      ),
                      title: Text(
                        'ANASAYFA',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Giris()));
                      }),
                  ListTile(
                      leading: Icon(
                        Icons.people,
                      ),
                      title: Text(
                        'ŞAİRLER',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SairList()));
                      }),
                  ListTile(
                      leading: Icon(
                        Icons.favorite_border,
                      ),
                      title: Text(
                        'FAVORİLER',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favoriler()));
                      }),
                  ListTile(
                      leading: Icon(
                        Icons.verified_user,
                      ),
                      title: Text(
                        'PROFİL',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profil()));
                      }),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                    ),
                    title: Text(
                      'ÇIKIŞ',
                      style: TextStyle(color: Colors.purple),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.book_outlined,
                    ),
                    title: Text(
                      'ŞİİR DEPOM',
                      style: TextStyle(color: Colors.purple),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SiirDepoSayfa()));
                    },
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

/*
 ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: Text(
                    'ANASAYFA',
                    style: TextStyle(color: Colors.purple),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Giris()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.people,
                  ),
                  title: Text(
                    'ŞAİRLER',
                    style: TextStyle(color: Colors.purple),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SairList()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                  ),
                  title: Text(
                    'FAVORİLER',
                    style: TextStyle(color: Colors.purple),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favoriler()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.verified_user,
                  ),
                  title: Text(
                    'PROFİL',
                    style: TextStyle(color: Colors.purple),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profil()));
                  }),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                ),
                title: Text(
                  'ÇIKIŞ',
                  style: TextStyle(color: Colors.purple),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.book_outlined,
                ),
                title: Text(
                  'ŞİİR DEPOM',
                  style: TextStyle(color: Colors.purple),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SiirDepoSayfa()));
                },
              ),
*/
