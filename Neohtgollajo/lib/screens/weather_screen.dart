// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:flutterproject/model/model.dart';
import 'package:flutterproject/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'not_loading_recommend.dart';
import 'package:flutterproject/config/palette.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirpollution});

  final dynamic parseWeatherData;
  final dynamic parseAirpollution;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  String? cityName;
  int? temp;

  late Widget icon;
  String? des;
  late Widget charactericon;
  Model model = Model();

  late Widget airIcon;
  late Widget airState;

  double? finedust;
  double? ultrafinedust;

  //FirebaseFirestore.instance.collection('user').doc(user!.email).get();

  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirpollution);
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.pushNamed(context, '/');
  }

  void getCurrentUser() {
    //새로운 유저 등록이 성공적이라면
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp'].toDouble();

    int condition = weatherData['weather'][0]['id'];

    int? index = airData['list'][0]['main']['aqi'];

    int month = int.parse(DateFormat('MM').format(date));

    final user = _authentication.currentUser;

    temp = temp2.toInt();
    // temp2.round();를 사용하면 소수점 첫째자리에서 반올림 가능

    cityName = weatherData['name'];

    icon = model.getWeatherIcon(condition)!;
    des = weatherData['weather'][0]['description'];
    charactericon = model.getcharacterIcon(month, condition);

    airIcon = model.getAirIcon(index)!;
    airState = model.getAirCondition(index)!;

    var condition2 = condition.toInt();

    finedust = airData['list'][0]['components']['pm10'].toDouble();
    ultrafinedust = airData['list'][0]['components']['pm2_5'].toDouble();

    print(cityName);
    print(temp);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          '내옷골라도',
          style: TextStyle(
            fontFamily: "JUA",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 86, 187, 241),
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return IconButton(
            //앱바의 왼쪽 아이콘
            icon: SvgPicture.asset(
              'svg/reorder_white_24dp.svg',
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: 30.0,
          );
        }),
        actions: [
          IconButton(
            //icon : Icon(
            //  Icons.exit_to_app_sharp,
            //  color : Colors.white,
            //),
            icon: SvgPicture.asset(
              'svg/logout_white_24dp.svg',
            ),
            onPressed: () {
              // _auth.signOut();
              // Navigator.pop(context);
              logout();
              //   getMessages();
            },
          )
        ],
        // leading: IconButton(
        //   //앱바의 왼쪽 아이콘
        //   icon: Icon(Icons.settings),
        //   onPressed: () {

        //   },
        //   iconSize: 30.0,
        // ),

        // actions: [ //앱바의 오른쪽 아이콘
        //   IconButton(
        //     icon: Icon(
        //       Icons.location_searching,
        //     ),
        //     onPressed: () {},
        //     iconSize: 30.0,
        //     )
        // ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("사용자 이메일",
                    style: TextStyle(
                      fontFamily: "JUA",
                      fontSize: 18,
                    )),
                accountEmail: Text(
                  '${loggedUser!.email}',
                  style: TextStyle(
                    fontFamily: "JUA",
                    fontSize: 18,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0))),
              ),
              ListTile(
                //leading: Icon(
                // Icons.settings,
                // color: Colors.black,
                //),
                title: Text('    Setting',
                    style: TextStyle(
                      fontFamily: "JUA",
                      fontSize: 18,
                    )),
                onTap: () {
                  //Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                //leading: Icon(
                //  Icons.check_box,
                //  color: Colors.black,
                //),
                title: Text(
                  '    개인 메모 보러가기',
                  style: TextStyle(
                    fontFamily: "JUA",
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/personal_note_personal');
                },
              )
            ],
          )),
      body: Container(
        // color: Color.fromARGB(255, 146, 168, 209), //정확한 색깔을 지정할 때 쓰는 코드
        color: Colors.white,
        child: Stack(
          children: [
            // Image.asset(
            //   'image/background.jpg',
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            // ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$cityName',
                              style: GoogleFonts.lato(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  110.0, // 도비야 이거 원래 200이엇는데 내 화면에서 110으로 바구니까 옷차림 버튼 눌림 원래는 안눌림
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    print('${getSystemTime()}');
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                          fontSize: 14.0, color: Colors.black),
                                    );
                                  },
                                ),
                                Text(DateFormat(' - EEEE, ').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 14.0, color: Colors.black)),
                                Text(DateFormat('d MMM, yyy').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 14.0, color: Colors.black))
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$temp\u2103',
                                  //디버그 할 때--web-renderer=html 옵션을 주어야한다
                                  style: GoogleFonts.lato(
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        icon, //model.dart 에서 구분되는 아이콘
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          '$des',
                                          style: TextStyle(
                                              fontFamily: "JUA",
                                              fontSize: 14.0,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'AQI(대기질지수)',
                                          style: TextStyle(
                                            fontFamily: "JUA",
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        airIcon,
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        airState
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '미세먼지',
                                          style: TextStyle(
                                            fontFamily: "JUA",
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '$finedust',
                                          style: GoogleFonts.lato(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '㎍/m3',
                                          style: GoogleFonts.lato(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '초미세먼지',
                                          style: TextStyle(
                                            fontFamily: "JUA",
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '$ultrafinedust',
                                          style: GoogleFonts.lato(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '㎍/m3',
                                          style: GoogleFonts.lato(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [charactericon],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/notloading',
                                    arguments: choiceCloth(
                                        parseinfo: widget.parseWeatherData));
                              },
                              label: Text(
                                ' 뭐 입지? ',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "JUA",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: Image.asset(
                                'image/recmicon.png',
                                width: 40,
                                height: 40,
                              ),
                              style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 146, 168, 209),
                                // backgroundColor: Palette.googleColor,
                                minimumSize: Size(250, 65),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Image.asset('image/memomy.png'),
                        iconSize: 40.0,
                        onPressed: () {
                          Navigator.pushNamed(context, '/note_personal');
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
