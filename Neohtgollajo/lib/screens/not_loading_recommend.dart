import 'package:flutter/material.dart';

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
    final args =
    ModalRoute
        .of(context)!
        .settings
        .arguments as choiceCloth;
    String? cityName = args.parseinfo['name'];
    double temp2 = args.parseinfo['main']['temp'];
    int condition = args.parseinfo['weather'][0]['id'];
    int? temp = temp2.toInt();
    String? recommendTop = cmodel.getTopInfo(temp)!;
    String? recommendOuter = cmodel.getOuterInfo(temp)!;
    String? recommendBottom = cmodel.getBottomInfo(temp)!;
    String? tipvar = cmodel.Tip(condition);
    return Scaffold(
      appBar: AppBar(
        title: const Text('착장 추천'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () { Navigator.pop(context);
          print('menu button is clicked');
          },
        ),
        //leading : 간단한 위젯이나 아이콘을 앱바 타이틀 왼쪽에 위치시킨다.
        // onPressed: 함수의 형태로 일반 버튼이나 아이콘 버튼을 터치했을 때 일어나는 이벤트를 정의하는 곳
        actions: <Widget>[
          // action: 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          children: [
            Expanded(
              // 사진
              child: Column(
                children: [
                  Image.asset('image/rabbit.png', height: 200, width: 200,),
                  Text('$temp\u2103', style: TextStyle(fontSize: 20.0, letterSpacing: 1.0))
                ],
              ),flex: 3,
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
                      Icon(
                        Icons.emoji_people,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 1.0,
                      ),
                      Icon(
                        Icons.emoji_people,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '$recommendOuter',
                        style: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
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
                      Icon(
                        Icons.emoji_people,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '$recommendTop',
                        style: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
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
                      Icon(
                        Icons.ac_unit_sharp,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '$recommendBottom',
                        style: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
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
                  Text('$tipvar'),
                ],
              ),flex: 1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/note_personal');
                      print('개인 피드백 버튼');
                    },
                    icon: Icon(
                      Icons.person_add_alt_1,
                      size: 40.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/personal_note_personal');
                      print('타인 피드백 버튼');
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

