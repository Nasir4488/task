import 'package:app_spot_task/model/noteModel.dart';
import 'package:app_spot_task/screens/addNote.dart';
import 'package:app_spot_task/screens/profileScreen.dart';
import 'package:app_spot_task/screens/showScreen.dart';
import 'package:app_spot_task/screens/updateScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/noteController.dart';
class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  var notestore=Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.to(Profile());

          }, icon: Icon(Icons.person)),
        ],
        title: Text("Notes",),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=>AddNote());
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: notestore.note
            .orderBy('time', descending: false) // Order by 'time' in ascending order
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = documents[index];
                var id = document.id.toString();
                var data = document.data() as Map<String, dynamic>;
                NoteModel displayNote = NoteModel.fromJson(data);
                return ListTile(
                  onTap: () {
                    Get.to(ShowNote(sigleNote: displayNote));
                  },
                  title: Text(displayNote.title),
                  subtitle: Text(displayNote.description),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => UpdateNote(note: displayNote, id: id));
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            notestore.delete(id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // Handle the case where snapshot.data is null
            return Text('No data available.');
          }
        },
      ),

    );
  }
}
