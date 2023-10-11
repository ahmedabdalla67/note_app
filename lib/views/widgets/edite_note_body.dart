import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditeNoteBody extends StatelessWidget {
  const EditeNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(title: 'Edite Note', icon: Icons.check),
        SizedBox(
          height: 16,
        ),
        CustomTextField(hint: 'Title'),
        SizedBox(
          height: 16,
        ),
        CustomTextField(
          hint: 'Content',
          maxLines: 7,
        ),
      ],
    );
  }
}
