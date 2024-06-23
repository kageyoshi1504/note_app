import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/main.dart';
import '../../../models/note.dart';
import '../../note_view.dart';

class NoteWidget extends StatefulWidget {
  NoteWidget({super.key, required this.note, required this.base});

  final Note note;
  BaseWidget base;
  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  TextEditingController noteControllerForTitle = TextEditingController();
  TextEditingController noteControllerForSubtitle = TextEditingController();

  @override
  void initState() {
    super.initState();

    noteControllerForTitle.text = widget.note.title;
    noteControllerForSubtitle.text = widget.note.subtitle;
  }

  @override
  void dispose() {
    super.dispose();

    noteControllerForTitle.dispose();
    noteControllerForSubtitle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (ctx) => NoteView(
              note: widget.note,
              noteControllerForTitle: noteControllerForTitle,
              noteControllerForSubtitle: noteControllerForSubtitle,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              noteControllerForTitle.text,
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
            subtitle: Text(noteControllerForSubtitle.text,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.45), fontSize: 20)),
            trailing: IconButton(
              icon: const Icon(CupertinoIcons.delete, color: Colors.black),
              onPressed: () {
                widget.base.dataStore.dalateTask(note: widget.note);
              },
              //hoverColor: Colors.transparent,
            ),
          ),
          Text(widget.note.dateTime.toString(),
              style: TextStyle(color: Colors.black.withOpacity(.5))),
        ],
      ),
    );
  }
}
