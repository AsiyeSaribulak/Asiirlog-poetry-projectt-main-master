import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poetry_project/ViewModel/GirisViewModel.dart';
import 'package:poetry_project/sayfalar/Anasayfa.dart';
import 'package:poetry_project/sayfalar/login.dart';
import 'package:provider/provider.dart';

final emailTextController = TextEditingController();

class SifremiUnuttum extends StatefulWidget {
  @override
  _SifremiUnuttumState createState() => _SifremiUnuttumState();
}

class _SifremiUnuttumState extends State {
  @override
  Widget build(BuildContext context) {
    return ((Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("şifremi unuttum"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 350,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/ForgotPassword.svg",
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Şifreyi Sıfırla",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "lütfen email adresinizi giriniz",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                ResetForm(),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  height: 45,
                  color: Colors.purple,
                  child: const Text(
                    "ŞİFRE SIFIRLA",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  onPressed: () {
                    GirisViewModel viewModel = Provider.of<GirisViewModel>(
                      context,
                      listen: false,
                    );
                    viewModel.sifreSifirla(
                      context,
                      emailTextController.text.trim(),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ),
        ))));
  }
}

class ResetForm extends StatelessWidget {
  const ResetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: emailTextController,
        decoration: const InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}
