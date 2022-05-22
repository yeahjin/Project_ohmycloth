import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterproject/screens/note_editor.dart';
import 'package:flutterproject/screens/note_reader.dart';
import 'package:flutterproject/widgets/note_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterproject/config/palette.dart';

class NotePersonal extends StatefulWidget {
  const NotePersonal({Key? key}) : super(key: key);

  @override
  State<NotePersonal> createState() => _NotePersonalState();
}

class _NotePersonalState extends State<NotePersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroudColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            '타인 피드백 메모',
            style: TextStyle(
              fontFamily: "JUA",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'svg/arrow_back_ios_white_24dp.svg',
          ),
          onPressed: () {
            Navigator.pop(context);
            print('menu button is clicked');
          },
        ),
        centerTitle: true,
        backgroundColor: Palette.backgroudColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "다른사람의 피드백을 볼 수 있으며\n"
                    "아래의 add 버튼을 눌러 메모할 수 있습니다",
                style: TextStyle(
                    fontFamily: "JUA",
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                ),
            ),
            SizedBox(height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").orderBy("creation_date", descending: true).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  //checking the conncetion state, if we still load the data we can display a progress
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData) {
                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCard((){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NoteReaderScreen(note),
                                ));
                      }, note))
                          .toList(),
                    );
                  }
                  return Text("there's no Notes", style: GoogleFonts.nunito(color: Colors.white), );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditorScreen()));
          },
          backgroundColor: Colors.blue,
          label: Text("Add Note",
          style: TextStyle(
            fontFamily: "JUA",
            fontSize: 15
          ),
          ),
          //icon: Icon(Icons.add),
      ),
    );
  }
}