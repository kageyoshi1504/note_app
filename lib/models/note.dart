import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  Note({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dateTime,
  });

  /// ID
  @HiveField(0)
  final String id;

  /// TITLE
  @HiveField(1)
  final String title;

  /// SubTitle
  @HiveField(2)
  final String subtitle;

  ///Date Time
  @HiveField(3)
  final DateTime dateTime;

  factory Note.create({
    required String? title,
    required String? subtitle,
    required DateTime? dateTime,
  }) =>
      Note(
          id: const Uuid().v1(),
          title: title ?? "",
          subtitle: subtitle ?? "",
          dateTime: dateTime ?? DateTime.now());
}
