import 'package:equatable/equatable.dart';

class NotesModel extends Equatable {
  const NotesModel({
    required this.id,
    required this.title,
    required this.content,
  });

  const NotesModel.initial()
      : id = '',
        title = '',
        content = '';

  NotesModel copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return NotesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

  final String id;
  final String title;
  final String content;

  @override
  List<Object?> get props => [
        id,
        title,
        content,
      ];
}
