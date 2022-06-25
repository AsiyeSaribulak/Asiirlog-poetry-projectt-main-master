import 'package:flutter/material.dart';

class SairlerSayfa extends StatefulWidget {
  const SairlerSayfa({Key? key}) : super(key: key);

  @override
  State<SairlerSayfa> createState() => _SairlerSayfaState();
}

class _SairlerSayfaState extends State<SairlerSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: const [
        Center(
          child: Text('Sairler'),
        )
      ]),
    );
  }
}
