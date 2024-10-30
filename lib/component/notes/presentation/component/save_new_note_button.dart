import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/component/notes/presentation/cubit/cubit.dart';

class SaveNewNoteButton extends StatelessWidget {
  const SaveNewNoteButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AddNoteCubit>().addNote();
        Future.delayed(const Duration(milliseconds: 500), () {
          context.read<NotesCubit>().getNotes();
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(context);
        });
      },
      child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: const Center(child: Text('Save'))),
    );
  }
}
