import 'package:flutter/material.dart';

mixin PasswordValidator implements StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PasswordValidatorState();
  }
}

class _PasswordValidatorState extends State {
  late bool gorunsunMu;
  late bool SekizKarakter;
  late bool RakamVarMi;
  void initState() {
    super.initState();
    setState(() {
      gorunsunMu = false;
      SekizKarakter = false;
      RakamVarMi = false;
    });
  }

  onPasswordChagned(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      SekizKarakter = false;
      if (password.length >= 8) SekizKarakter = true;
      RakamVarMi = false;
      if (numericRegex.hasMatch(password)) RakamVarMi = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Şifre oluştur",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "şifre oluştur",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lütfen aşağıdaki kriterleri içeren güvenli bir şifre oluşturun",
              style: TextStyle(
                  color: Colors.grey.shade600, fontSize: 16, height: 1.5),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (password) => onPasswordChagned(password),
              obscureText: !gorunsunMu,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      gorunsunMu = !gorunsunMu;
                    });
                  },
                  icon: gorunsunMu
                      ? Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "password",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: SekizKarakter ? Colors.green : Colors.transparent,
                    border: SekizKarakter
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("En az sekiz karakter içermeli."),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: RakamVarMi ? Colors.green : Colors.transparent,
                    border: RakamVarMi
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("En az bir rakam içermeli"),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              height: 40,
              minWidth: double.infinity,
              onPressed: () {},
              color: Colors.black,
              child: Text(
                "ŞİFRE OLUŞTUR",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
      ),
    );
  }
}
