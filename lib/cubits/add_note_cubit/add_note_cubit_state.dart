part of 'add_note_cubit_cubit.dart';

abstract class AddNoteCubitState {}

final class AddNoteCubitInitial extends AddNoteCubitState {}

final class AddNoteCubitLoading extends AddNoteCubitState {}

final class AddNoteCubitSuccess extends AddNoteCubitState {}

final class AddNoteCubitFailure extends AddNoteCubitState {
  String errorMessage;
  AddNoteCubitFailure(this.errorMessage);
}
