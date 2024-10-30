import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/common/state/state.dart';
import 'package:notes_app/component/notes/domain/model/notes_model.dart';
import 'package:notes_app/component/notes/domain/repository/repository.dart';

class NotesCubit extends Cubit<PatternState<List<NotesModel>>> {
  NotesCubit(this._repository) : super(Initial());

  final NotesRepository _repository;
  Future<void> getNotes() async {
    try {
      emit(Loading());
      await Future.delayed(const Duration(milliseconds: 500));
      final data = await _repository.getNotes();

      emit(Success(data: data));
    } catch (error, stackTrace) {
      emit(Fail(error: error, stackTrace: stackTrace));
    }
  }
}
