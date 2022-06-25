import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Siir.dart';

class SiirGoster extends StatefulWidget {
  late Siir siir;
  SiirGoster({required this.siir});

  @override
  State<SiirGoster> createState() => _SiirGosterState();
}

class _SiirGosterState extends State<SiirGoster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "${widget.siir.baslik}",
          style: GoogleFonts.novaSquare(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              color: Color.fromARGB(255, 228, 204, 232),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.siir.icerik}",
                    style: GoogleFonts.almendra(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 65,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.purple,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("müzik eklenecek");
        },
        tooltip: "müzik",
        child: Icon(Icons.audiotrack),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
      ),
    );
  }
}
