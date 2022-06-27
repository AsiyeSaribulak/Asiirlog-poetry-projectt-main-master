import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:poetry_project/component/PageWiev.dart';
import '../Wİdget/SairList.dart';
import '../Wİdget/SiirGiris.dart';
import '../dataAccess/SiirlerDao.dart';
import '../models/Siir.dart';
import '../sayfalar/Anasayfa.dart';
import '../sayfalar/FavorilerSayfa.dart';
import '../sayfalar/Profil.dart';
import '../sayfalar/SiirDepoSayfa.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GirisState();
  }
}

class _GirisState extends State {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color(0xFFFBD6D2),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF190B7),
          title: const Text('ASİİRLOG'),
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
        body: Container(child: SiirGiris()),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xFFFBD6D2),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavorilerSayfa()));
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
                    color: Colors.black26,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Asiye Sarıbulak | ASİİRLOG'),
                  ),
                ),
              ],
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
