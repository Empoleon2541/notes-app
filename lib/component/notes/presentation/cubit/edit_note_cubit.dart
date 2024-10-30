import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/common/state/state.dart';
import 'package:notes_app/component/notes/domain/repository/repository.dart';

class EditNoteCubit extends Cubit<PatternState<String>> {
  EditNoteCubit(this._repository) : super(Initial());

  final NotesRepository _repository;

  String _title = '';
  String _content = '';
  bool _isEdit = false;

  void setContent(String content) {
    _content = content;
  }

  void setTitle(String title) {
    _title = title;
  }

  void setIsEdit(bool isEdit) {
    _isEdit = isEdit;
  }

  bool getIsEdit() {
    return _isEdit;
  }

  void emitSuccess() {
    emit(Success());
  }

  void emitLoading() {
    emit(Loading());
  }

  void editNote(String id) async {
    emit(Loading());
    final notes = await _repository.editNote(id, _title, _content);
    if (notes == 'Note Successfuly Removed') {
      emit(Success(data: notes));
    } else {
      emit(Fail(error: 'Failed to remove note', stackTrace: StackTrace.empty));
    }
  }
}
