import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/component/notes/data/remote_source/remote_source.dart';
import 'package:notes_app/component/notes/presentation/pages/notes_page.dart';
import 'package:notes_app/component/notes/data/repository/notes_repository_impl.dart';

import 'component/notes/presentation/cubit/cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NotesRemoteSource>(
          create: (context) => NotesRemoteSource(),
        ),
        RepositoryProvider<NotesRepositoryImpl>(
          create: (context) {
            final remoteSource = context.read<NotesRemoteSource>();
            return NotesRepositoryImpl(remoteSource);
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NotesCubit>(
            create: (context) {
              final repository = context.read<NotesRepositoryImpl>();
              return NotesCubit(repository);
            },
          ),
          BlocProvider<AddNoteCubit>(
            create: (context) {
              final repository = context.read<NotesRepositoryImpl>();
              return AddNoteCubit(repository);
            },
          ),
          BlocProvider<RemoveNoteCubit>(
            create: (context) {
              final repository = context.read<NotesRepositoryImpl>();
              return RemoveNoteCubit(repository);
            },
          ),
          BlocProvider<EditNoteCubit>(
            create: (context) {
              final repository = context.read<NotesRepositoryImpl>();
              return EditNoteCubit(repository);
            },
          ),
          BlocProvider<EditButtonCubit>(
            create: (context) {
              return EditButtonCubit();
            },
          ),
        ],
        child: MaterialApp(
          title: 'Notes App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const NotesPage(),
        ),
      ),
    );
  }
}
