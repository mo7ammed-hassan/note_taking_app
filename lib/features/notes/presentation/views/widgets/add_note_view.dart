import 'package:flutter/material.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key, required this.boxName});
  final String boxName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: AddNoteViewBody(
            boxName: boxName,
          ),
        ),
      ),
    );
  }
}
