import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poetry_project/sayfalar/KayitOl.dart';
import 'package:poetry_project/secreen/GirisEkrani.dart';
import 'package:provider/provider.dart';

class GirisViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void kayitSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(create: (context) {
          KayitOl();
        });
      },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }

  void epostaVeSifreIleGiris(
    BuildContext context,
    String eposta,
    String sifre,
  ) async {
    try {
      UserCredential kullaniciKimligi = await _auth.signInWithEmailAndPassword(
          email: eposta, password: sifre);
      User? kullanici = kullaniciKimligi.user;
      if (kullanici != null) {
        _snackbarGoster(context, "Giriş Başarılı.");
        print(_auth.currentUser?.emailVerified ?? 'Kayıt yok');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Giris()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        _snackbarGoster(context, "Kullanıcı bulunamadı.");
      } else if (e.code == "wrong-password") {
        _snackbarGoster(context, "Yanlış şifre girdiniz.");
      } else if (e.code == "") {
        _snackbarGoster(context, "Lütfen şifrenizi giriniz.");
      }
    } catch (e) {
      print(e);
    }
  }

  void sifreSifirla(BuildContext context, String eposta) async {
    if (eposta.isNotEmpty) {
      await _auth.sendPasswordResetEmail(email: eposta);
      _snackbarGoster(context, "Şifre sıfırlama bağlantısı gönderildi.");
    } else {
      _snackbarGoster(context, "Lütfen e-posta adresinizi girin.");
    }
  }

  void _snackbarGoster(BuildContext context, String mesaj) {
    SnackBar snackBar = SnackBar(content: Text(mesaj));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
