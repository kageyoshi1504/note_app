import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/views/home/widget/fab.dart';
import 'package:note_app/views/home/widget/note_widget.dart';
import '../../main.dart';
import '../../models/note.dart';
import 'components/custom_icon.dart';
import 'widget/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
        valueListenable: base.dataStore.listenToNote(),
        builder: (ctx, Box<Note> box, Widget? child) {
          var notes = box.values.toList();

          return Scaffold(
            backgroundColor: Colors.white,
            //FAB
            floatingActionButton: const FAB(),
            body: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomAppBar(
                  x: const Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  y: CustomIcon(
                    icon: CupertinoIcons.search,
                    onTap: () {
                      //print("Search Page");
                    },
                  ),
                  z: CustomIcon(
                    icon: CupertinoIcons.settings,
                    onTap: () {
                      //print("Settings Page");
                    },
                  ),
                ),

                // Divider
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Divider(
                    thickness: 1,
                    indent: 100,
                  ),
                ),
                // Bottom ListView :Note
                _box(notes, base),
              ],
            ),
          );
        });
  }

  SizedBox _box(
    List<Note> notes,
    BaseWidget base,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 585,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            var note = notes[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: NoteWidget(note: note , base : base),
            );
          }),
    );
  }
}
