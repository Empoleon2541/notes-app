import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MockNetworkService {
  static const String _notesKey = 'notes';

  Future<void> createNote(String title, String content) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = await getNotes();
    notes.add({'title': title, 'content': content});
    await prefs.setString(_notesKey, json.encode(notes));
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesString = prefs.getString(_notesKey);
    if (notesString != null) {
      return List<Map<String, dynamic>>.from(json.decode(notesString));
    }
    return [];
  }

  Future<void> updateNote(int index, String title, String content) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = await getNotes();
    notes[index] = {'title': title, 'content': content};
    await prefs.setString(_notesKey, json.encode(notes));
  }

  Future<void> deleteNote(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = await getNotes();
    notes.removeAt(index);
    await prefs.setString(_notesKey, json.encode(notes));
  }
}
