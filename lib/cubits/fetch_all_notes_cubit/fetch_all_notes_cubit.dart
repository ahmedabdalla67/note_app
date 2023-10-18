import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/consts.dart';
import 'package:note_app/models/notes_model.dart';

part 'fetch_all_notes_state.dart';

class FetchAllNotesCubit extends Cubit<FetchAllNotesState> {
  FetchAllNotesCubit() : super(FetchAllNotesCubitInitial());
  List<NoteModel>? notes;
  fetchNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();

    emit(FetchSuccess());
  }
}
