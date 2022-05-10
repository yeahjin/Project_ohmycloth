import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Model {
  Widget? getWeatherIcon(int condition) {
    if (condition < 532) {
      return Image.asset('assets/rain.png',
      width: 64.0,
      height: 60.0,
      );
    } else if (condition <= 622) {
      return Image.asset('assets/snow.png',
      width: 64.0,
      height: 60.0,
      );
    } else if (condition == 800) {
      return Image.asset('assets/sun.png',
      width: 64.0,
      height: 60.0,
      );
      
      // return SvgPicture.asset(
      //   'svg/climacon-sun.svg',
      //   color: Colors.black87,
      //   width: 70.0,
      //   height: 68.0,
      // ); // svg파일 사용법

    } else if (condition > 800) {
      return Image.asset('assets/cloudsun.png',
      width: 64.0,
      height: 60.0,
      );
    }
  }

   Widget getcharacterIcon(int month , int condition) {
     if (condition < 532){
       int characterDice = Random().nextInt(2);
       if (characterDice == 0){
         return Image.asset('assets/rain_wind.png',
       width: 200.0,
       height: 200.0,);
       }
       else {
         return Image.asset('assets/rain_wind.png',
       width: 200.0,
       height: 200.0,);
       }
     }
     else if (condition <= 622){
       int characterDice = Random().nextInt(3);
       if (characterDice == 0){
         return Image.asset('assets/snow1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 1){
         return Image.asset('assets/snow2.png',
       width: 200.0,
       height: 200.0,);
       }
       else{
         return Image.asset('assets/snow3.png',
       width: 200.0,
       height: 200.0,);
       }
     }
     else if (month <= 4 && month >= 2){
       int characterDice = Random().nextInt(5);
       if (characterDice == 0){
         return Image.asset('assets/s1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 1){
         return Image.asset('assets/s2.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 2){
         return Image.asset('assets/s3.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 3){
         return Image.asset('assets/sf1.png',
       width: 200.0,
       height: 200.0,);
       }
       else{
         return Image.asset('assets/sf2.png',
       width: 200.0,
       height: 200.0,);
       }
     }
     else if (month >= 5 && month <= 7){
       int characterDice = Random().nextInt(6);
       if (characterDice == 0){
         return Image.asset('assets/hot1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 1){
         return Image.asset('assets/hot2.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 2){
         return Image.asset('assets/summer1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 3){
         return Image.asset('assets/summer2.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 4){
         return Image.asset('assets/summer3.png',
       width: 200.0,
       height: 200.0,);
       }
       else{
         return Image.asset('assets/summer4.png',
       width: 200.0,
       height: 200.0,);
       }
     }
     else if (month >= 8 && month <= 10){
       int characterDice = Random().nextInt(5);
       if (characterDice == 0){
         return Image.asset('assets/f1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 1){
         return Image.asset('assets/f2.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 2){
         return Image.asset('assets/f3.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 3){
         return Image.asset('assets/sf1.png',
       width: 200.0,
       height: 200.0,);
       }
       else{
         return Image.asset('assets/sf2.png',
       width: 200.0,
       height: 200.0,);
       }
     }
     else {
       int characterDice = Random().nextInt(6);
       if (characterDice == 0){
         return Image.asset('assets/cold1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 1){
         return Image.asset('assets/cold2.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 2){
         return Image.asset('assets/winter1.png',
       width: 200.0,
       height: 200.0,);
       }
       else if (characterDice == 3){
         return Image.asset('assets/winter2.png',
       width: 200.0,
       height: 200.0,);
       }
       else{
         return Image.asset('assets/winter3.png',
       width: 200.0,
       height: 200.0,);
       }
     }
   }

  

  Widget? getAirIcon(int? index){
    if( index == 1 ){
      return Image.asset('image/good.png',
      width: 37.0,
      height: 35.0,
      );
    }
    else if( index == 2 ){
      return Image.asset('image/fair.png',
      width: 37.0,
      height: 35.0,
      );
    }
    else if( index == 3 ){
      return Image.asset('image/moderate.png',
      width: 37.0,
      height: 35.0,
      );
    }
    else if( index == 4 ){
      return Image.asset('image/poor.png',
      width: 37.0,
      height: 35.0,
      );
    }
    else if( index == 5 ){
      return Image.asset('image/bad.png',
      width: 37.0,
      height: 35.0,
      );
    }

  }

  Widget? getAirCondition(int? index) {
    if (index == 1) {
      return Text(
        '"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 2) {
      return Text(
        '"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 3) {
      return Text(
        '"보통"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 4) {
      return Text(
        '"나쁨"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 5) {
      return Text(
        '"매우나쁨"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }

  }
}
