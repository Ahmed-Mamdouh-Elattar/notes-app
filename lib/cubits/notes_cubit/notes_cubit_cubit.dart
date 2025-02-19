import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());

  fetchNotesData() async {
    emit(NotesCubitLoading());
    try {
      var noteBox = await Hive.openBox<NoteModel>(kNoteBox);
      List<NoteModel> notes = noteBox.values.toList();
      emit(NotesCubitSuccess(notes: notes));
    } catch (e) {
      emit(NotesCubitFailure(errMassege: e.toString()));
    }
  }
}
