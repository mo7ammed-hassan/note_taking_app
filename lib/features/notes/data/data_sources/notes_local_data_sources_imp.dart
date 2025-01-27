// ignore_for_file: avoid_print
import 'package:note_taking_app/core/services/note_services.dart';
import 'package:note_taking_app/features/notes/data/data_sources/notes_local_data_sources.dart';
import 'package:note_taking_app/features/notes/domain/entites/notes_entity.dart';

class NotesLocalDataSourcesImp extends NotesLocalDataSources {
  final NoteService noteService;

  NotesLocalDataSourcesImp({required this.noteService});
  @override
  Future<void> addNewNote({
    required String boxName,
    required String title,
    required String content,
  }) async {
    NoteService noteService = NoteService();
    try {
      await noteService.addNewNote(
          title: title, content: content, boxName: boxName);
      print('success add new note');
    } on Exception catch (e) {
      print('Error adding : $e');
    }
  }

  @override
  Future<void> deleteNote({required int index, required String boxName}) async {
    try {
      NoteService noteService = NoteService();
      await noteService.deleteNote(index: index, boxName: boxName);
      print('deleting note');
    } on Exception catch (e) {
      print('Error deleting : $e');
    }
  }

  @override
  Future<void> editNote({
    required String boxName,
    required int index,
    required String title,
    required String content,
  }) async {
    try {
      NoteService noteService = NoteService();
      await noteService.editNote(
          index: index, title: title, content: content, boxName: boxName);
      print('editing note');
    } on Exception catch (e) {
      print('Error editing : $e');
    }
  }

  @override
  List<NotesEntity> getAllNotes({required String boxName}) {
    return noteService.getAllNotes(boxName: boxName);
  }
}
