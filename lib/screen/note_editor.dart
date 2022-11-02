import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/helpers/global.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  String date = DateTime.now().toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Add a new task",
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write here title',
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Write here Content',
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add(
            {
              "note_title": _titleController.text,
              "creation_date": date,
              "note_content": _mainController.text,
            },
          ).then((value) {
            printDebug(value.id);
            Navigator.pop(context);
          }).catchError(
            (error) => printDebug("Failed to add new Task due to $error"),
          );
        },
        child: Icon(
          Icons.save,
          color: Colors.blueGrey[900],
        ),
      ),
    );
  }
}
