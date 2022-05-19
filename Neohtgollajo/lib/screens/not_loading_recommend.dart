import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/cloth_model.dart';

class choiceCloth {
  final dynamic parseinfo;

  choiceCloth({required this.parseinfo});
}

class NotLoadingRecommend extends StatefulWidget {
  const NotLoadingRecommend({Key? key}) : super(key: key);

  @override
  _NotLoadingRecommendState createState() => _NotLoadingRecommendState();
}

class _NotLoadingRecommendState extends State<NotLoadingRecommend> {
  ClothModel cmodel = ClothModel();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as choiceCloth;
    String? cityName = args.parseinfo['name'];
    var date = DateTime.now();
    double temp2 = args.parseinfo['main']['temp'].toDouble();
    int condition = args.parseinfo['weather'][0]['id'];
    int? temp = temp2.toInt();
    String? recommendTop = cmodel.getTopInfo(temp)!;
    String? recommendOuter = cmodel.getOuterInfo(temp)!;
    String? recommendBottom = cmodel.getBottomInfo(temp)!;
    String? tipvar = cmodel.Tip(condition);

    int month = int.parse(DateFormat('MM').format(date));
    // 맨 위 게절별 일러스트
    late Widget cseason = cmodel.getIllsust(condition, month)!;
    // 옷추천 일러스트 에 대한 코드
    // 아우터 추천
    late Widget outericon1 = cmodel.getOuterIcon1(temp)!;
    late Widget outericon2 = cmodel.getOuterIcon2(temp)!;
    late Widget outericon3 = cmodel.getOuterIcon3(temp)!;
    // 상의 추천
    late Widget topicon1 = cmodel.getTopIcon1(temp)!;
    late Widget topicon2 = cmodel.getTopIcon2(temp)!;

    //하의 추천
    late Widget bottomicon1 = cmodel.getBottomIcon1(temp)!;
    late Widget bottomicon2 = cmodel.getBottomIcon2(temp)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '착장 추천',
          style: TextStyle(
              fontFamily: "JUA", fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            print('menu button is clicked');
          },
        ),
        //leading : 간단한 위젯이나 아이콘을 앱바 타이틀 왼쪽에 위치시킨다.
        // onPressed: 함수의 형태로 일반 버튼이나 아이콘 버튼을 터치했을 때 일어나는 이벤트를 정의하는 곳
        actions: <Widget>[],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        child: Column(
          children: [
            Expanded(
              // 사진
              child: Column(
                children: [
                  cseason,
                ],
              ),
              flex: 3,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              // 추천 의상
              child: Column(
                children: <Widget>[
                  // 상의
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      outericon3,
                      SizedBox(
                        width: 1.0,
                      ),
                      outericon2,
                      SizedBox(
                        width: 1.0,
                      ),
                      outericon1,
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '$recommendOuter',
                        style: TextStyle(
                            fontFamily: "JUA",
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                    ],
                  ),
                  //하의
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      topicon2,
                      SizedBox(
                        width: 1.0,
                      ),
                      topicon1,
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '$recommendTop',
                        style: TextStyle(
                            fontFamily: "JUA",
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                    ],
                  ),
                  // 신발
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bottomicon2,
                      SizedBox(
                        width: 1.0,
                      ),
                      bottomicon1,
                      SizedBox(width: 3.0),
                      Text(
                        '$recommendBottom',
                        style: TextStyle(
                            fontFamily: "JUA",
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tip!',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '$tipvar',
                    style: TextStyle(
                        fontFamily: "JUA", fontSize: 15.0, letterSpacing: 1.0),
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('image/memoicon.png'),
                    iconSize: 40.0,
                    onPressed: () {
                      Navigator.pushNamed(context, '/note_personal');
                      print('공유 메모 버튼');
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/personal_note_personal');
                      print('개인 메모 버튼');
                    },
                    icon: Icon(
                      Icons.share,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
    //   Scaffold(
    //     appBar: AppBar(
    //       title: const Text('착장 추천'),
    //       centerTitle: true,
    //       backgroundColor: Colors.lightBlue[300],
    //       elevation: 0.0,
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back_ios),
    //         onPressed: () {
    //           Navigator.pop(context);
    //           print('menu button is clicked');
    //         },
    //       ),
    //     ),
    //     body: Column(
    //       children: [Text(cityName!),Text('$temp'),Text('$condition')],
    //     )
    //   // final args =
    //   // ModalRoute.of(context)!.settings.arguments as choiceCloth;
    //   // // double temp2 = args.parseinfo['main']['temp'];
    //   // // int? temp = temp2.toInt();
    //   // String? cityName = args.parseinfo['name'];
    //   // // int condition = args.parseinfo['weather'][0]['id'];
    //   // return Column(children: [
    //   //   Text(cityName!),
    //   // ],);
    // );
  }
}
