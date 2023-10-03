import 'package:app_spot_task/controller/noteController.dart';
import 'package:app_spot_task/model/noteModel.dart';
import 'package:app_spot_task/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UpdateNote extends StatefulWidget {
  NoteModel note;
  var id;
  UpdateNote({Key? key,required this.note,required this.id}) : super(key: key);
  
  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  var note=Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          TextField(
            controller: note.title,
            decoration: InputDecoration(
                hintText: widget.note.title
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            minLines: 5,
            maxLines: 10,
            controller: note.des,
            decoration: InputDecoration(
                hintText: widget.note.description
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            note.updateNote(widget.id);
            note.title.text="";
            note.des.text="";
            Get.to(()=>HomeScreen());

          }, child: Text("Update Note"))


        ],
      ),
    );
  }
}
