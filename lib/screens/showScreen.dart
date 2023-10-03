import 'package:app_spot_task/model/noteModel.dart';
import 'package:flutter/material.dart';
class ShowNote extends StatefulWidget {
  NoteModel sigleNote;
  ShowNote({Key? key,required this.sigleNote}) : super(key: key);

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sigleNote.title),
      ),
      body: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Text(
          widget.sigleNote.description,
        ),
      ),
    );
  }
}
