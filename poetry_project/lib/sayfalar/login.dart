import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:poetry_project/ViewModel/GirisViewModel.dart';
import 'package:poetry_project/secreen/GirisEkrani.dart';
import 'package:poetry_project/sayfalar/KayitOl.dart';
import 'package:poetry_project/secreen/SifremiUnuttum.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _errorMessage = " ";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  int activeIndex = 0;
  var refTest = FirebaseDatabase.instance.ref().child("test");

  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0), //bura
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                height: 350,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 0 ? 1 : 0,
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: SvgPicture.asset("assets/images/completing.svg"),
                        // Image.network('https://creator-cdn.icons8.com/TdZLWvgYWQfGs9C_hqyb2CNGZkUEjlRNJvh1EWMQNqQ/rs:fit:450:300/czM6Ly9pY29uczgu/aWNvbnM4LWNyZWF0/b3ItcHJvZC9hc3Nl/dHMvZWRpdG9yL2Nv/bGxhZ2UvNTU1LzZm/YzYwMmU1LTVhZGYt/NGZlYS1hMTM5LTM4/NTY1ODQ4OWNjYy5q/cGc.jpg',height: 400,),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 1 ? 1 : 0,
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: SvgPicture.asset("assets/images/login.svg"),
                        // Image.network('https://creator-cdn.icons8.com/qWpABfKXqiQ7r9I8QkGCDZIgaJZ6m_UQvilehOLO67k/rs:fit:450:300/czM6Ly9pY29uczgu/aWNvbnM4LWNyZWF0/b3ItcHJvZC9hc3Nl/dHMvZWRpdG9yL2Nv/bGxhZ2UvOTc0Lzdl/YTg4YjMyLWU5OGUt/NGQ0Ny1iZWE1LTQ1/ODFjNGFiMjJmMS5q/cGc.jpg',height: 400,),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 2 ? 1 : 0,
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: SvgPicture.asset("assets/images/joy.svg"),
                        //Image.network('https://ouch-cdn2.icons8.com/vSx9H3yP2D4DgVoaFPbE4HVf6M4Phd-8uRjBZBnl83g/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNC84/MzcwMTY5OS1kYmU1/LTQ1ZmEtYmQ1Ny04/NTFmNTNjMTlkNTcu/c3Zn.png',height: 400,),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 3 ? 1 : 0,
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: SvgPicture.asset("assets/images/read.svg"),
                        //Image.network('https://creator-cdn.icons8.com/cOsPXSncfF_ySQRwgKQIJUwQShpCrsez8XyeVk-8s5Q/rs:fit:450:300/czM6Ly9pY29uczgu/aWNvbnM4LWNyZWF0/b3ItcHJvZC9hc3Nl/dHMvZWRpdG9yL2Nv/bGxhZ2UvODM4L2Mx/Yjk5NTM2LTEyN2It/NDAyZC04ZWFiLTAw/N2U3NjExNGQzYi5q/cGc.jpg',height: 400,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'Email',
                  hintText: 'e-mail',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  prefixIcon: Icon(
                    Iconsax.user,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (val) {
                  validateEmail(val);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.datetime,
                maxLength: 6,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Şifremi Unuttum',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SifremiUnuttum()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                height: 45,
                color: Colors.purple,
                child: Text(
                  "GİRİŞ YAP",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  if (passwordController == null) {
                    if (passwordController == null) {
                      showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                                title: Text("Hata!"),
                                content: Text("Parola boş bırakılamaz"),
                              ));
                    }
                  } else {
                    GirisViewModel viewModel = Provider.of<GirisViewModel>(
                      context,
                      listen: false,
                    );
                    viewModel.epostaVeSifreIleGiris(
                      context,
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hesabın yok mu?',
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KayitOl()));
                    },
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ); //Scaffold
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Lütfen bir email giriniz";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Email adresi geçerli değil";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
