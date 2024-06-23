import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/note.dart';

import 'data/hive_data_store.dart';
import 'views/home/home_view.dart';

Future<void> main() async {
  // Intitial Hive DB
  await Hive.initFlutter();

  // Register Hive Adapter
  Hive.registerAdapter<Note>(NoteAdapter());

  /// Open box
  var box = await Hive.openBox<Note>("noteBox");

  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => BaseWidget(child: const NoteApp())),
  );
}

class BaseWidget extends InheritedWidget {
  BaseWidget({super.key, required this.child}) : super(child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App",
      theme: ThemeData(
        textTheme: const TextTheme(),
      ),
      home: const HomeView(),
    );
  }
}
