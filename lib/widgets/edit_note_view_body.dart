import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_builder.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchNotesData();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 45,
          ),
          CustomTextField(
            hint: widget.note.title,
            onChange: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLines: 5,
            onChange: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          ColorsListBuilderForEdit(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
