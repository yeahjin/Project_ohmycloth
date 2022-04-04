import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Model {
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return Image.asset('assets/rain.png',
      width: 64.0,
      height: 60.0,
      );
    } else if (condition < 600) {
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

   Widget getcharacterIcon(int condition) {
    if (condition < 300) {
      return Image.asset('assets/sum.png',
      width: 64.0,
      height: 60.0,
      );
    }
    else{
      return Image.asset('assets/sum.png', //gif도 가능
      width: 200.0,
      height: 100.0,
      );
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
