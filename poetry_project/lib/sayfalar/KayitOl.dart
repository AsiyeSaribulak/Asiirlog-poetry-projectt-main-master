import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:poetry_project/sayfalar/login.dart';
import 'package:poetry_project/secreen/GirisEkrani.dart';

//import 'package:poetry_project/Validation/PasswordValidation.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  //PasswordValidator passwordValidator = PasswordValidator();
  @override
  State<StatefulWidget> createState() {
    return _KayitOlState();
  }
}

class _KayitOlState extends State {
  final TextEditingController userCotroller = new TextEditingController();
  final TextEditingController epostaController = new TextEditingController();
  final TextEditingController sifreController = new TextEditingController();
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("kayıt ol"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 350,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/signup.svg",
                      // height: MediaQuery.of(context).size.height*0.35,
                    ) //Image.network('https://cdn.pixabay.com/photo/2013/03/29/13/38/address-book-97572_960_720.png',height: 400,),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: userCotroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: "Name and Surname",
                  hintText: "Name and Surname",
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
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                      width: 2,
                    ),
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
              SizedBox(height: 10.0),
              TextField(
                controller: epostaController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: "Email Adress",
                  hintText: "Email Adress",
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
                    Icons.email,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle:
                      TextStyle(color: Colors.black, fontSize: 18.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: sifreController,
                obscureText: true,
                keyboardType: TextInputType.datetime,
                maxLength: 6,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: "şifre",
                  hintText: "şifre",
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
                    Icons.password,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle:
                      TextStyle(color: Colors.black, fontSize: 18.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                height: 45,
                color: Colors.purple,
                child: Text(
                  "Kaydol",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: epostaController.text,
                          password: sifreController.text)
                      .then((value) {
                    print("Yeni hesap oluştur");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hesabın mı var?",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'GİRİŞ YAP',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
