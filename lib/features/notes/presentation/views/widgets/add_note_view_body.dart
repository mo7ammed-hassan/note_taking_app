import 'package:flutter/material.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/custom_add_note_app_bar.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/note_writing_section.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({
    super.key,
    required this.boxName,
  });
  final String boxName;
  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
// Create the controllers here
  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAddNoteAppBar(
          title: 'Add Note',
          titleController: titleController,
          noteController: noteController,
          boxName: widget.boxName,
        ),
        Expanded(
          child: NoteWritingSection(
            titleController: titleController,
            noteController: noteController,
          ),
        ),
      ],
    );
  }
}
