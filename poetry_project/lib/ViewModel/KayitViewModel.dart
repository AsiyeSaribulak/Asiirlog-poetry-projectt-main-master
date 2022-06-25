import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poetry_project/sayfalar/login.dart';

class KayitViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void epostaVeSifreIleKayit(
    BuildContext context,
    String ad,
    String eposta,
    String sifre,
  ) async {
    try {
      UserCredential kullaniciKimligi = await _auth
          .createUserWithEmailAndPassword(email: eposta, password: sifre);
      User? kullanici = kullaniciKimligi.user;
      await kullanici?.updateDisplayName(ad);
      await kullanici?.sendEmailVerification();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        _snackbarGoster(context, "şifre sadece rakamlardan oluşmalı.");
      } else if (e.code == "email-already-in-use") {
        _snackbarGoster(
            context, "Bu e-posta ile daha önce hesap oluşturulmuş.");
      } else if (e.code == "blank-password") {
        _snackbarGoster(context, "şifre alanı boş bırakılamaz.");
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
