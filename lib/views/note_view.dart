import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/main.dart';
import 'package:note_app/utils/constanst.dart';
import '../models/note.dart';
import 'home/components/custom_icon.dart';
import 'home/widget/custom_app_bar.dart';

class NoteView extends StatefulWidget {
  NoteView(
      {super.key,
      required this.note,
      required this.noteControllerForTitle,
      required this.noteControllerForSubtitle});

  final Note? note;
  TextEditingController? noteControllerForTitle;
  TextEditingController? noteControllerForSubtitle;

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  var title;
  var subTitle;
  var dateTime;

  dynamic updateNote() {
    if (widget.noteControllerForTitle?.text != null &&
        widget.noteControllerForSubtitle?.text != null) {
      try {
        widget.noteControllerForTitle?.text = title;
        widget.noteControllerForSubtitle?.text = subTitle;

        widget.note?.save();
        Navigator.of(context).pop();
      } catch (error) {
        nothingEnterUpdateNote(context);
      }
    } else {
      if (title != null && subTitle != null) {
        var note = Note.create(
            title: title, subtitle: subTitle, dateTime: DateTime.now());
        BaseWidget.of(context).dataStore.addNotes(note: note);
      } else {
        emptyFieldsWarning(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              x: CustomIcon(
                  icon: CupertinoIcons.back,
                  onTap: () {
                    Navigator.pop(context);
                    // Get.to(() => const NotesApp());
                  }),
              y: CustomIcon(
                icon: CupertinoIcons.eye,
                onTap: () {
                  //print("Cha bt lam gi lun a =))");
                },
              ),
              z: CustomIcon(
                icon: Icons.save,
                onTap: () {
                  updateNote();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24),
              width: double.infinity,
              child: TextFormField(
                controller: widget.noteControllerForTitle,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                cursorColor: Colors.grey,
                //focusNode: _node_2,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tiêu đề",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                onFieldSubmitted: (value) {
                  title = value;
                },
                onChanged: (value) {
                  //subtitle = value;
                  title = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24),
              width: double.infinity,
              child: TextFormField(
                controller: widget.noteControllerForSubtitle,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Colors.grey,
                //focusNode: _node_2,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nội dung",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                onFieldSubmitted: (value) {
                  subTitle = value;
                },
                onChanged: (value) {
                  subTitle = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
