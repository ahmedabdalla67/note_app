import 'package:flutter/material.dart';
import 'package:note_app/models/notes_model.dart';
import 'package:note_app/views/widgets/edite_note_body.dart';

class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: EditeNoteBody(
          noteModel: note,
        ),
      ),
    );
  }
}
