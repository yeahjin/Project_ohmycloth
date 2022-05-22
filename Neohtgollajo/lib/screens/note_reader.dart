import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterproject/config/palette.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: Palette.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: Palette.backgroudColor,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'svg/arrow_back_ios_white_24dp.svg',
          ),
          onPressed: () {
            Navigator.pop(context);
            print('menu button is clicked');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: TextStyle(
                fontFamily: "JUA",
                fontSize: 22,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0,),
            Text(
              widget.doc["creation_date"],
              style: TextStyle(
                fontFamily: "JUA",
              ),
            ),
            SizedBox(height: 28.0,),
            Text(
              widget.doc["note_content"],
              style: TextStyle(
                fontFamily: "JUA",
                fontSize: 20,
              ),
              //overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}