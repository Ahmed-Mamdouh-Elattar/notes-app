import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.color,
    this.isChoosed = false,
  });
  final Color color;
  final bool isChoosed;
  @override
  Widget build(BuildContext context) {
    return isChoosed
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 25,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 25,
          );
  }
}

class ColorsListBuilderForAdd extends StatefulWidget {
  const ColorsListBuilderForAdd({super.key});

  @override
  State<ColorsListBuilderForAdd> createState() =>
      _ColorsListBuilderForAddState();
}

class _ColorsListBuilderForAddState extends State<ColorsListBuilderForAdd> {
  final List<Color> colors = const [
    Color(0xff264653),
    Color(0xff2a9d8f),
    Color(0xffe9c46a),
    Color(0xfff4a261),
    Color(0xffe76f51),
    Color(0xff335c67),
    Color(0xfffff3b0),
    Color(0xffe09f3e),
    Color(0xff9e2a2b),
    Color(0xff540b0e),
  ];

  int circleNumber = 2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            circleNumber = index;
            BlocProvider.of<AddNoteCubit>(context).color = colors[index];
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomCircleAvatar(
              color: colors[index],
              isChoosed: circleNumber == index ? true : false,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsListBuilderForEdit extends StatefulWidget {
  const ColorsListBuilderForEdit({super.key, required this.note});
  final NoteModel note;
  @override
  State<ColorsListBuilderForEdit> createState() =>
      _ColorsListBuilderForEditState();
}

class _ColorsListBuilderForEditState extends State<ColorsListBuilderForEdit> {
  final List<Color> colors = const [
    Color(0xff264653),
    Color(0xff2a9d8f),
    Color(0xffe9c46a),
    Color(0xfff4a261),
    Color(0xffe76f51),
    Color(0xff335c67),
    Color(0xfffff3b0),
    Color(0xffe09f3e),
    Color(0xff9e2a2b),
    Color(0xff540b0e),
  ];
  late int circleNumber;
  @override
  void initState() {
    super.initState();
    circleNumber = colors.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            circleNumber = index;
            widget.note.color = colors[index].value;
            widget.note.save();
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomCircleAvatar(
              color: colors[index],
              isChoosed: circleNumber == index ? true : false,
            ),
          ),
        ),
      ),
    );
  }
}
