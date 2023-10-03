import 'package:app_spot_task/controller/noteController.dart';
import 'package:app_spot_task/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
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
              hintText: "title"
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: note.des,
            decoration: InputDecoration(
                hintText: "Description"
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            note.addnote();
            note.title.text="";
            note.des.text="";
            Get.to(HomeScreen());
          }, child: Text("Add Note"))


        ],
      ),
    );
  }
}
