import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/models/notes_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditeNoteBody extends StatefulWidget {
  const EditeNoteBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditeNoteBody> createState() => _EditeNoteBodyState();
}

class _EditeNoteBodyState extends State<EditeNoteBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          title: 'Edite Note',
          icon: Icons.check,
          onPressed: () {
            widget.noteModel.title = title ?? widget.noteModel.title;
            widget.noteModel.content = content ?? widget.noteModel.content;
            BlocProvider.of<FetchAllNotesCubit>(context).fetchNotes();
            widget.noteModel.save();

            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          hint: 'Title',
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          onChanged: (value) {
            content = value;
          },
          hint: 'Content',
          maxLines: 7,
        ),
      ],
    );
  }
}
