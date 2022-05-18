import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterproject/screens/personal_note_reader.dart';
import 'package:flutterproject/config/palette.dart';
import '../data/DBHelper.dart';
import '../model/memo.dart';
import '../widgets/noteCardPersonal.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  // dispose 함수 없앰 => 계속 다른 곳에서 db를 생성하면 db를 닫게한다.

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Palette.backgroudColor,
      title: Text(
        '개인 메모',
        style: TextStyle(
            fontFamily: "JUA",
            fontSize: 20),
      ),
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
          ? Text(
        'No Notes',
        style: TextStyle(
            fontFamily: "JUA",
            color: Colors.white,
            fontSize: 15),
      )
          : buildNotes(),
    ),
  );

  Widget buildNotes() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: notes.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final note = notes[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteDetailPage(noteId: note.id!),
          ));

          refreshNotes();
        },
        child: NoteCardWidget(note: note, index: index),
      );
    },
  );
}
