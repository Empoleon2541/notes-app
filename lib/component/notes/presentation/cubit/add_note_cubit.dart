import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/common/state/state.dart';
import 'package:notes_app/component/notes/domain/repository/repository.dart';

class AddNoteCubit extends Cubit<PatternState<String>> {
  AddNoteCubit(this._repository) : super(Initial());

  final NotesRepository _repository;

  String _title = '';
  String _content = '';

  void setContent(String content) {
    _content = content;
  }

  void setTitle(String title) {
    _title = title;
  }

  void emitSuccess() {
    emit(Success());
  }

  void emitLoading() {
    emit(Loading());
  }

  bool isSaveEnabled() {
    return _title != '' && _content != '';
  }

  void addNote() async {
    emit(Loading());
    final notes = await _repository.addNote(_title, _content);
    if (notes == 'Note Successfuly Added') {
      emit(Success(data: notes));
    } else {
      emit(Fail(error: 'Failed to add note', stackTrace: StackTrace.empty));
    }
  }
}
