part of 'notes_cubit_cubit.dart';

abstract class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesCubitLoading extends NotesCubitState {}

final class NotesCubitSuccess extends NotesCubitState {
  final List<NoteModel> notes;

  NotesCubitSuccess({required this.notes});
}

final class NotesCubitFailure extends NotesCubitState {
  final String errMassege;

  NotesCubitFailure({required this.errMassege});
}
