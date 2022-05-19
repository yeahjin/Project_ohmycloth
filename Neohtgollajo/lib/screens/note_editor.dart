import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/palette.dart';
import '../model/cloth_model.dart';
import '../data/DBHelper.dart';
import '../model/note.dart';

class choiceCloth {
  final dynamic parseinfo;

  choiceCloth({required this.parseinfo});
}

class NoteEditorScreen extends StatefulWidget {
  NoteEditorScreen({Key? key}) : super(key: key);
  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  ClothModel cmodel = ClothModel();
  int color_id = Random().nextInt(Palette.cardsColor.length);
  String date = DateTime.now().toString();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: Palette.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "새로운 메모 추가하기",
          style: TextStyle(
              fontFamily: "JUA",
              fontSize: 22,
              //fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: '노트제목'),
              style: TextStyle(
                fontFamily: "JUA",
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: TextStyle(
                fontFamily: "JUA",
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: '노트내용'),
              style: TextStyle(
                fontFamily: "JUA",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.googleColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
                  (error) => print("Failed to add new Note due to error"));
          final note = Note(
            title: _titleController.text,
            description: _mainController.text,
            createdTime: DateTime.now(),
          );
          await NotesDatabase.instance.create(note);
        },
        child: Column(
          children: [
            Text(
              "\n"
                  "저장\n",
              style: TextStyle(
                fontFamily: "JUA",
                color:Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}