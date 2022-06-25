import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poetry_project/sayfalar/login.dart';
import 'package:poetry_project/sayfalar/KayitOl.dart';
import 'package:poetry_project/secreen/GirisEkrani.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var refKullanici = FirebaseDatabase.instance.ref().child("kullanici_tablo");
  @override
  Future<void> kullaniciEkle() async {
    var bilgi = HashMap<String, dynamic>();
    bilgi["ad"] = "asiye";
    bilgi["soyad"] = "sarıbulak";
    bilgi["sifre"] = "asiye123";
    refKullanici.push().set(bilgi);
  }

  @override
  void initState() {
    super.initState();
    kullaniciEkle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "HOŞ GELDİNİZ",
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Giris())));
                    },
                    icon: Icon(
                      Icons.lock_open,
                      size: 40,
                    ),
                    tooltip: 'Oturum Açmadan giriş',
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 35,
                      right: 0,
                      bottom: 0,
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2016/10/27/07/21/bird-1773599__340.png',
                        height: 500,
                      ),
                    ),
                  ],
                ),
                /* decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("picture/unlock.png"),
                ),
              ),*/
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text("GİRİŞ YAP",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => KayitOl()));
                      },
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Kayıt ol",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
