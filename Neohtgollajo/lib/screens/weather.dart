import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _Weather createState() => _Weather();
}

class _Weather extends State<Weather> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser; //등록된 유저관리 해주는 변수, 값 초기화X라 ? 붙임

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() { //새로운 유저 등록이 성공적이라면
    try{
      final user = _authentication.currentUser;
      if(user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    }catch(e) {
      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Text('Weather'),
      ),
    );
  }
}