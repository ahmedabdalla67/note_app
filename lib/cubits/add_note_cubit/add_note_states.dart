abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucceed extends AddNoteState {}

class FetchNote extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}
