import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotesData();
            Navigator.pop(context);
          } else if (state is AddNoteCubitFailure) {
            print("error is ${state.errorMessage}");
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubitLoading,
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 0.85,
              minChildSize: 0.4,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    color: Color(0xff303030),
                  ),
                  child: AddNoteForm(
                    scrollController: scrollController,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
