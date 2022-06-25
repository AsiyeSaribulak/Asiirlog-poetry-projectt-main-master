import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'asiirlog',
                style: GoogleFonts.novaSquare(
                  color: Colors.black,
                  fontSize: 5,
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/siir.jpg'))),
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
          ],
        ),
      ),
    );
  }
}
