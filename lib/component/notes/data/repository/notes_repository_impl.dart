import 'package:notes_app/component/notes/data/remote_source/remote_source.dart';
import 'package:notes_app/component/notes/domain/model/notes_model.dart';
import 'package:notes_app/component/notes/domain/repository/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl(this._remoteSource);

  final NotesRemoteSource _remoteSource;

  @override
  Future<List<NotesModel>> getNotes() {
    return _remoteSource.getNotes();
  }

  @override
  Future<String> addNote(String title, String content) {
    return _remoteSource.addNote(title: title, content: content);
  }

  @override
  Future<String> removeNote(String id) {
    return _remoteSource.removeNote(id: id);
  }

  @override
  Future<String> editNote(String id, String title, String content) {
    return _remoteSource.editNote(id: id, title: title, content: content);
  }
}
