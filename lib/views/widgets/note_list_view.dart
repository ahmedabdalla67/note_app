import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app/cubits/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/models/notes_model.dart';
import 'package:note_app/views/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllNotesCubit, FetchAllNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<FetchAllNotesCubit>(context).notes!;
        return Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return CustomNoteItem(
                noteModel: notes[index],
              );
            },
            itemCount: notes.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        );
      },
    );
  }
}
