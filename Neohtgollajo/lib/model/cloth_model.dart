import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClothModel {
  Widget? getIllsust(int condition, int month) {
    if (condition < 532) {
      int characterDice = Random().nextInt(2);
      if (characterDice == 0) {
        return Image.asset(
          'assets/rain_wind.png',
          width: 200.0,
          height: 200.0,
        );
      } else {
        return Image.asset(
          'assets/rain_wind.png',
          width: 200.0,
          height: 200.0,
        );
      }
    } else if (condition <= 622) {
      int characterDice = Random().nextInt(3);
      if (characterDice == 0) {
        return Image.asset(
          'assets/snow1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 1) {
        return Image.asset(
          'assets/snow2.png',
          width: 200.0,
          height: 200.0,
        );
      } else {
        return Image.asset(
          'assets/snow3.png',
          width: 200.0,
          height: 200.0,
        );
      }
    } else if (month <= 4 && month >= 2) {
      int characterDice = Random().nextInt(5);
      if (characterDice == 0) {
        return Image.asset(
          'assets/s1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 1) {
        return Image.asset(
          'assets/s2.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 2) {
        return Image.asset(
          'assets/s3.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 3) {
        return Image.asset(
          'assets/sf1.png',
          width: 200.0,
          height: 200.0,
        );
      } else {
        return Image.asset(
          'assets/sf2.png',
          width: 200.0,
          height: 200.0,
        );
      }
    } else if (month >= 5 && month <= 7) {
      int characterDice = Random().nextInt(6);
      if (characterDice == 0) {
        return Image.asset(
          'assets/hot1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 1) {
        return Image.asset(
          'assets/hot2.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 2) {
        return Image.asset(
          'assets/summer1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 3) {
        return Image.asset(
          'assets/summer2.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 4) {
        return Image.asset(
          'assets/summer3.png',
          width: 200.0,
          height: 200.0,
        );
      } else {
        return Image.asset(
          'assets/summer4.png',
          width: 200.0,
          height: 200.0,
        );
      }
    } else if (month >= 8 && month <= 10) {
      int characterDice = Random().nextInt(5);
      if (characterDice == 0) {
        return Image.asset(
          'assets/f1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 1) {
        return Image.asset(
          'assets/f2.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 2) {
        return Image.asset(
          'assets/f3.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 3) {
        return Image.asset(
          'assets/sf1.png',
          width: 200.0,
          height: 200.0,
        );
      } else {
        return Image.asset(
          'assets/sf2.png',
          width: 200.0,
          height: 200.0,
        );
      }
    } else {
      int characterDice = Random().nextInt(6);
      if (characterDice == 0) {
        return Image.asset(
          'assets/cold1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 1) {
        return Image.asset(
          'assets/cold2.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 2) {
        return Image.asset(
          'assets/winter1.png',
          width: 200.0,
          height: 200.0,
        );
      } else if (characterDice == 3) {
        return Image.asset(
          'assets/winter2.png',
          width: 200.0,
          height: 200.0,
        );
      } else {
        return Image.asset(
          'assets/winter3.png',
          width: 200.0,
          height: 200.0,
        );
      }
    }
  }

  String? getOuterInfo(int temp) {
    if (temp > 27) {
      return "없음"; //팁에 에이컨 땜에 추울 수 있으니 얇은 겉옷 추천
    } else if (temp > 23) {
      return "없음";
    } else if (temp > 20) {
      return "얇은 가디건";
    } else if (temp > 17) {
      return "가디건, 얇은 자켓";
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

  Widget? getOuterIcon1(int temp) {
    int characterDice = Random().nextInt(5);
    if (temp > 27) {
      if (characterDice == 0) {
        return Image.asset(
          'clothillust/null.png',
          width: 45.0,
          height: 45.0,
        );
      }
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/얇은가디건.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/가디건.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/얇은자켓.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/트렌치코트.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/coat.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/패딩.png',
        width: 45.0,
        height: 45.0,
      );
    }
  }

  Widget? getOuterIcon2(int temp) {
    int characterDice = Random().nextInt(5);
    if (temp > 27) {
      if (characterDice == 0) {
        return Image.asset(
          'clothillust/null.png',
          width: 45.0,
          height: 45.0,
        );
      }
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/얇은 자켓.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/가디건.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/야상.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/두꺼운 코트.png',
        width: 45.0,
        height: 45.0,
      );
    }
  }

  Widget? getOuterIcon3(int temp) {
    int characterDice = Random().nextInt(5);
    if (temp > 27) {
      if (characterDice == 0) {
        return Image.asset(
          'clothillust/null.png',
          width: 45.0,
          height: 45.0,
        );
      }
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/야상.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/가죽자켓.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    }
  }

  String? getTopInfo(int temp) {
    if (temp > 27) {
      return "민소매, 반팔티";
    } else if (temp > 23) {
      return "일반 셔츠, 반팔티";
    } else if (temp > 20) {
      return "얇은 가디건, 긴팔티";
    } else if (temp > 17) {
      return "얇은 니트, 맨투맨";
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

  Widget? getTopIcon1(int temp) {
    if (temp > 27) {
      return Image.asset(
        'clothillust/민소매.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/일반 셔츠.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/얇은가디건.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/얇은 니트.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/맨투맨.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/맨투맨.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/맨투맨.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/기모제품.png',
        width: 45.0,
        height: 45.0,
      );
    }
  }

  Widget? getTopIcon2(int temp) {
    if (temp > 27) {
      return Image.asset(
        'clothillust/반팔티.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/반팔티.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/긴팔티.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/맨투맨.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/니트.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/니트.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/니트.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
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
      return "긴바지";
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
  Widget? getBottomIcon1(int temp) {
    if (temp > 27) {
      return Image.asset(
        'clothillust/반바지.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/반바지.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/긴바지.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/긴바지.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/긴바지.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/긴바지.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/긴바지.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/기모제품.png',
        width: 45.0,
        height: 45.0,
      );
    }
  }
  Widget? getBottomIcon2(int temp) {
    if (temp > 27) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 23) {
      return Image.asset(
        'clothillust/면바지.png',
        width: 45,
        height: 45,
      );
    } else if (temp > 20) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 17) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 12) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 10) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp > 6) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    } else if (temp < 4) {
      return Image.asset(
        'clothillust/null.png',
        width: 45.0,
        height: 45.0,
      );
    }
  }
  String? Tip(int condition) {
    if (condition < 300) {
      return "우산을 꼭 챙겨가세요";
    } else if (condition < 600) {
      return "눈이 와요!";
    } else {
      return "없음";
    }
  }
}
