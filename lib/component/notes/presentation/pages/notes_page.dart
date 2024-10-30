import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/common/state/state.dart';
import 'package:notes_app/component/notes/domain/model/notes_model.dart';
import 'package:notes_app/component/notes/presentation/component/add_note_button.dart';
import 'package:notes_app/component/notes/presentation/component/notes_display.dart';
import 'package:notes_app/component/notes/presentation/cubit/cubit.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NotesCubit, PatternState<List<NotesModel>>>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const _Initial(),
            Loading() => _Loading(),
            Success(:final data) => _Success(
                notes: data ?? <NotesModel>[],
              ),
            Fail() => _Fail(),
          };
        },
        listener: (context, state) {},
      ),
    );
  }
}

class _Initial extends StatelessWidget {
  const _Initial();

  @override
  Widget build(BuildContext context) {
    context.read<NotesCubit>().getNotes();

    return _Loading();
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _Success extends StatelessWidget {
  const _Success({required this.notes});

  final List<NotesModel> notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notes App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              AddNoteButton(),
            ],
          ),
          if (notes.isEmpty) ...[
            const SizedBox(
                height: 600, child: Center(child: Text('Notes are Empty')))
          ],
          if (notes.isNotEmpty) ...[
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Column(
                    children: [
                      NotesDisplay(
                        note: note,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ]),
      ),
    );
  }
}

class _Fail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Unable to get notes.'));
  }
}
