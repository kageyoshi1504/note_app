import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/note.dart';

/// All the [CRUD] method operation For Hive DB
class HiveDataStore {
  static const boxName = 'noteBox';
  final Box<Note> box = Hive.box<Note>(boxName);

  // Add New Notes To Box
  Future<void> addNotes({required Note note}) async {
    await box.put(note.id, note);
  }

  // Show Notes

  Future<Note?> getNotes({required String id}) async {
    return box.get(id);
  }

  // Update Note

  Future<void> updateNotes({required Note note}) async {
    await note.save();
  }

  // Delete Note

  Future<void> dalateTask({required Note note}) async {
    await note.delete();
  }

  // Listen to Box Changes
  ValueListenable<Box<Note>> listenToNote() => box.listenable();
}
