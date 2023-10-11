import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const CustomNoteItem();
        },
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}
