import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/component/notes/presentation/cubit/cubit.dart';

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({
    super.key,
    required this.isEnabled,
    required this.id,
  });
  final bool isEnabled;
  final String id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isEnabled) {
          context.read<EditButtonCubit>().toggleState();
        } else {
          context.read<EditNoteCubit>().editNote(id);
          context.read<EditButtonCubit>().toggleState();
          context.read<NotesCubit>().getNotes();
          Future.delayed(const Duration(milliseconds: 500), () {
            context.read<NotesCubit>().getNotes();
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pop(context);
          });
        }
      },
      child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(child: Text(isEnabled ? 'Save' : 'Edit'))),
    );
  }
}
