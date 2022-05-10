import 'package:flutter/material.dart';
import 'package:flutterproject/data/my_location.dart' show MyLocation;
import 'package:flutterproject/data/network.dart';
import 'package:flutterproject/screens/weather_screen.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = '0d0cc1131b44cd6ea0027e60e69dc007';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //생성되면서 getLocation을 실행함
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather'
            '?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=$latitude3&lon=$longitude3&appid=$apiKey');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirpollution: airData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Center(
            child: Expanded(
          child: Column(children: [
            IconButton(
              icon: Image.asset('image/waiting.png'),
              iconSize: 300,
              onPressed: () {
                getLocation();
              },
            ),
            Text(
              '도리가 날씨를 받아오고 있는 중입니다',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ]),
        )),
      ),
      //위치 허용 권한을 받을 때 띄우고 싶은 위젯 위치
    );
  }
}
