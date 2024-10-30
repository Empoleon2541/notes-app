import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/common/state/state.dart';
import 'package:notes_app/component/notes/domain/repository/repository.dart';

class RemoveNoteCubit extends Cubit<PatternState<String>> {
  RemoveNoteCubit(this._repository) : super(Initial());

  final NotesRepository _repository;

  void emitSuccess() {
    emit(Success());
  }

  void emitLoading() {
    emit(Loading());
  }

  void removeNote(String id) async {
    emit(Loading());
    final notes = await _repository.removeNote(id);
    if (notes == 'Note Successfuly Removed') {
      emit(Success(data: notes));
    } else {
      emit(Fail(error: 'Failed to remove note', stackTrace: StackTrace.empty));
    }
  }
}
