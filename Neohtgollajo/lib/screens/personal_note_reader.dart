import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutterproject/config/palette.dart';
import '../data/DBHelper.dart';
import '../model/note.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'svg/arrow_back_ios_white_24dp.svg',
        ),
        onPressed: () {
          Navigator.pop(context);
          print('menu button is clicked');
        },
      ),
      backgroundColor: Palette.backgroudColor,
      actions: [deleteButton()],
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            note.title,
            style: TextStyle(
              fontFamily: "JUA",
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            DateFormat.yMMMd().format(note.createdTime),
            style: TextStyle(
                fontFamily: "JUA",
                color: Colors.black),
          ),
          SizedBox(height: 28.0),
          Text(
            note.description,
            style: TextStyle(
                fontFamily: "JUA",
                color: Colors.black,
                fontSize: 20),
          )
        ],
      ),
    ),
  );
  Widget deleteButton() => IconButton(
    icon: SvgPicture.asset(
      'svg/delete_white_24dp.svg',
    ),
    onPressed: () async {
      await NotesDatabase.instance.delete(widget.noteId);

      Navigator.of(context).pop();
    },
  );
}