import 'package:app_spot_task/model/noteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteController extends GetxController{
  var note=FirebaseFirestore.instance.collection("Notes");
  var title=TextEditingController();
  var des=TextEditingController();

  void addnote()async{
    NoteModel newNote=NoteModel(title: title.text, description: des.text, time: DateTime.now()
    );
    await note.add(newNote.toJson());
  }
  void delete(var id) async{
    await note.doc(id).delete();
    update();
  }
  void updateNote(var id) async{
    NoteModel newNote=NoteModel(title: title.text,
        description: des.text,
        time: DateTime.now()
    );
    Map<String, dynamic> newNoteData = newNote.toJson();
    await note.doc(id).update(newNoteData);
    update();
  }
}