import 'package:flutter/material.dart';

import 'package:flutter_learn/modules/todolist/view/my_note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Todo App'),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyNote()));
              },
            ),
            body: Container(
              child: Padding(padding: EdgeInsets.all(5), child: getNoteList()),
            )));
  }

  Widget getNoteList() {
    return ListView.builder(
        //   itemCount: nc.notes.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                  title: Text("title",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  leading: Text(
                    (index + 1).toString() + ".",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Wrap(children: <Widget>[
                    IconButton(icon: Icon(Icons.create), onPressed: () {}),
                    IconButton(icon: Icon(Icons.delete), onPressed: () {})
                  ])),
            ));
  }
}
