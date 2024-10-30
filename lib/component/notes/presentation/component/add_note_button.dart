import 'package:flutter/material.dart';
import 'package:notes_app/component/notes/presentation/pages/note_page.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
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
