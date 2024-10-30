import 'package:notes_app/component/notes/domain/model/notes_model.dart';

abstract class NotesRepository {
  Future<List<NotesModel>> getNotes();
  Future<String> addNote(String title, String content);
  Future<String> removeNote(String id);
  Future<String> editNote(String id, String title, String content);
}
