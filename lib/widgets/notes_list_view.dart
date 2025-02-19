import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        if (state is NotesCubitSuccess) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) => NoteItem(
              note: state.notes[index],
            ),
          );
        } else if (state is NotesCubitLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotesCubitFailure) {
          return Text('there is error ${state.errMassege}');
        } else {
          return const Text('there is error');
        }
      },
    );
  }
}
