import 'package:notes_app/component/notes/data/remote_source/mock_notes_service.dart';
import 'package:notes_app/component/notes/domain/model/notes_model.dart';

class NotesRemoteSource {
  final MockNetworkService _mockNetworkService = MockNetworkService();

  Future<List<NotesModel>> getNotes() async {
    final notesData = await _mockNetworkService.getNotes();
    return notesData
        .asMap()
        .entries
        .map((entry) => NotesModel(
              id: entry.key.toString(),
              title: entry.value['title']!,
              content: entry.value['content']!,
            ))
        .toList();
  }

  Future<String> addNote({
    required String title,
    required String content,
  }) async {
    await _mockNetworkService.createNote(title, content);
    return "Success";
  }

  Future<String> removeNote({
    required String id,
  }) async {
    await _mockNetworkService.deleteNote(int.parse(id));
    return "Success";
  }

  Future<String> editNote({
    required String id,
    required String title,
    required String content,
  }) async {
    await _mockNetworkService.updateNote(int.parse(id), title, content);
    return "Success";
  }
}
