import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/consts.dart';
import 'package:note_app/cubits/fetch_all_notes_cubit/fetch_all_notes_cubit.dart';
import 'package:note_app/models/notes_model.dart';
import 'package:note_app/views/widgets/color_list_view.dart';
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
            widget.noteModel.save();
            BlocProvider.of<FetchAllNotesCubit>(context).fetchNotes();

            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          hint: widget.noteModel.title,
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
          hint: widget.noteModel.content,
          maxLines: 7,
        ),
        const SizedBox(
          height: 16,
        ),
        EditeNoteColorList(
          note: widget.noteModel,
        ),
      ],
    );
  }
}

class EditeNoteColorList extends StatefulWidget {
  const EditeNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditeNoteColorList> createState() => _EditeNoteColorListState();
}

class _EditeNoteColorListState extends State<EditeNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = kColors.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
