import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/component/notes/domain/model/notes_model.dart';
import 'package:notes_app/component/notes/presentation/cubit/cubit.dart';
import 'package:notes_app/component/notes/presentation/pages/note_page.dart';

class NotesDisplay extends StatelessWidget {
  const NotesDisplay({
    required this.note,
    super.key,
  });
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            context.read<EditButtonCubit>().setState(false);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NotePage(
                        isAdd: false,
                        isEdit: true,
                        id: note.id,
                        title: note.title,
                        content: note.content,
                      )),
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    note.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                _EditButton(
                  note: note,
                ),
                _DeleteButton(id: note.id)
              ],
            ),
          ),
        ),
        if (note.content.isNotEmpty) ...[
          Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
              height: 100,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(note.content),
              )),
        ]
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({
    required this.note,
  });

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<EditButtonCubit>().setState(true);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NotePage(
                      isAdd: false,
                      isEdit: true,
                      id: note.id,
                      title: note.title,
                      content: note.content,
                    )),
          );
        },
        icon: const Icon(Icons.edit));
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<RemoveNoteCubit>().removeNote(id);
          context.read<NotesCubit>().getNotes();
        },
        icon: const Icon(Icons.delete));
  }
}
