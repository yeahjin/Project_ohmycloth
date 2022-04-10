import 'package:flutter/material.dart';

class ClothModel {
  String? getOuterInfo(int temp) {
    if (temp > 27) {
      return "없음"; //팁에 에이컨 땜에 추울 수 있으니 얇은 겉옷 추천
    } else if (temp > 23) {
      return "없음";
    } else if (temp > 20) {
      return "얇은 가디건";
    } else if (temp > 17) {
      return "가디건, 얇은 자켓" ;
    } else if (temp > 12) {
      return "자켓, 가디건, 야상";
    } else if (temp > 10) {
      return "트랜치코트, 야상, 가죽자켓";
    } else if (temp > 6) {
      return "코트";
    } else if (temp < 4) {
      return "패딩, 두꺼운 코트";
    }
  }

  String? getTopInfo(int temp) {
    if (temp > 27) {
      return "민소매, 반팔";
    } else if (temp > 23) {
      return "일반 셔츠, 반팔티";
    } else if (temp > 20) {
      return "얇은 가디건, 긴팔티";
    } else if (temp > 17) {
      return "얇은 니트, 맨투맨" ;
    } else if (temp > 12) {
      return "맨투맨, 니트";
    } else if (temp > 10) {
      return "맨투맨, 니트";
    } else if (temp > 6) {
      return "맨투맨, 니트";
    } else if (temp < 4) {
      return "기모제품"; // 팁에 목도리를 착용하세요
    }
  }

  String? getBottomInfo(int temp) {
    if (temp > 27) {
      return "반바지";
    } else if (temp > 23) {
      return "반바지, 면바지";
    } else if (temp > 20) {
      return "긴바지";
    } else if (temp > 17) {
      return "긴바지" ;
    } else if (temp > 12) {
      return "긴바지";
    } else if (temp > 10) {
      return "긴바지"; //레깅스로 바꾸고 스타킹은 tip으로
    } else if (temp > 6) {
      return "긴바지";
    } else if (temp < 4) {
      return "기모제품";
    }
  }
  String? Tip(int condition){
    if (condition < 300) {
      return "우산을 꼭 챙겨가세요";
    } else if (condition < 600) {
      return "눈이 와요!";
    }
    else{
      return "없음";
    }
  }
}
