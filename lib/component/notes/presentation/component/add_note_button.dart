import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/component/notes/presentation/cubit/cubit.dart';
import 'package:notes_app/component/notes/presentation/pages/note_page.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<AddNoteCubit>().resetContent();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NotePage(
                      isAdd: true,
                      isEdit: false,
                    )),
          );
        },
        icon: const Icon(Icons.add));
  }
}
