import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/component/notes/presentation/component/component.dart';
import 'package:notes_app/component/notes/presentation/cubit/cubit.dart';

class NotePage extends StatelessWidget {
  const NotePage({
    required this.isEdit,
    required this.isAdd,
    this.id,
    this.title,
    this.content,
    super.key,
  });
  final bool isEdit;
  final bool isAdd;
  final String? id;
  final String? title;
  final String? content;
  @override
  Widget build(BuildContext context) {
    final isEnabled = context.watch<EditButtonCubit>().state;
    return BlocBuilder<EditButtonCubit, bool>(builder: (context, state) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        initialValue: title,
                        onChanged: (value) {
                          if (isAdd) {
                            context.read<AddNoteCubit>().setTitle(value);
                          } else {
                            context.read<EditNoteCubit>().setTitle(value);
                          }
                        },
                        enabled: isAdd || isEnabled,
                        decoration: const InputDecoration(hintText: 'Title'),
                      )),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      initialValue: content,
                      enabled: isAdd || isEnabled,
                      onChanged: (value) {
                        if (isAdd) {
                          context.read<AddNoteCubit>().setContent(value);
                        } else {
                          context.read<EditNoteCubit>().setContent(value);
                        }
                      },
                      minLines: 8,
                      maxLines: 8,
                      decoration: const InputDecoration(
                        hintText: 'Content',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isEdit)
                  EditNoteButton(
                    isEnabled: state,
                    id: id!,
                  ),
                if (isAdd) const SaveNewNoteButton(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
