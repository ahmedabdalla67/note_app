part of 'fetch_all_notes_cubit.dart';

@immutable
sealed class FetchAllNotesState {}

final class FetchAllNotesCubitInitial extends FetchAllNotesState {}

final class FetchSuccess extends FetchAllNotesState {}
