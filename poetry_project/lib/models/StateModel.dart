import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class StateModel {
  late bool isLoading;
  late FirebaseAuth user;
  late bool isLoggedIn;
  late bool showAds;
  late bool sendDaily;

  StateModel.WithId(this.user);

  StateModel(
      this.isLoading, this.user, this.isLoggedIn, this.showAds, this.sendDaily);

  StateModel.WithTwo(this.isLoading, this.isLoggedIn);
}
