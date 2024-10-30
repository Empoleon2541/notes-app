import 'package:flutter_bloc/flutter_bloc.dart';

class EditButtonCubit extends Cubit<bool> {
  EditButtonCubit() : super(false);

  void setState(bool state) {
    emit(state);
  }

  void toggleState() {
    emit(!state);
  }
}
