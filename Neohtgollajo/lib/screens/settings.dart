import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  int coldorhot = 0;
  String condition = "나는 추위도 더위도 비슷하게 느껴요";

  void initState() {
    // TODO: implement initState
    super.initState();
    //생성되면서 getLocation을 실행함
  }

  void getcondition(int coh) {
    if (coh == -1) {
      condition = "나는 추위를 타는 편이에요";
    } else if (coh == 0) {
      condition = "나는 추위도 더위도 비슷하게 느껴요";
    } else {
      condition = "나는 더위를 많이 느끼는 편이에요";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  '$condition',
                  style: GoogleFonts.lato(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                      
                ),

                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('추위를 타요'),
                        IconButton(
                            onPressed: () {
                              coldorhot = -1;
                              print(coldorhot);
                              getcondition(coldorhot);
                              print(condition);
                            },
                            icon: Icon(Icons.exposure_minus_1))
                      ],
                    ),
                    Column(
                      children: [
                        Text('적당한 것 같아요'),
                        IconButton(
                            onPressed: () {
                              coldorhot = 0;
                              getcondition(coldorhot);
                              print(coldorhot);
                              print(condition);
                            },
                            icon: Icon(Icons.exposure_zero_rounded))
                      ],
                    ),
                    Column(
                      children: [
                        Text('더위를 타요'),
                        IconButton(
                            onPressed: () {
                              coldorhot = 1;
                              getcondition(coldorhot);
                            },
                            icon: Icon(Icons.plus_one))
                      ],
                    ),
                  ],
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
