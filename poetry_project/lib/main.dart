import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poetry_project/Cubit/SiirDepoCubit.dart';
import 'package:poetry_project/ViewModel/GirisViewModel.dart';
import 'package:poetry_project/dataAccess/SiirDepoDao.dart';
import 'package:poetry_project/models/Siir.dart';
import 'package:poetry_project/sayfalar/Anasayfa.dart';
import 'package:provider/provider.dart';

void main() async {
  visualDensity:
  VisualDensity.adaptivePlatformDensity;
  const String email = 'fredrik.eilertsen@gail.com';
  final bool isValid = EmailValidator.validate(email);
  print('Email is valid? ' + (isValid ? 'yes' : 'no'));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SiirDepoCubit(SiirDepoDao())),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GirisViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
