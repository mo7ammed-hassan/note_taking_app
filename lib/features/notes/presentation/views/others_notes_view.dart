import 'package:flutter/material.dart';
import 'package:note_taking_app/core/utils/constants/boxes.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/custom_add_note_floating_action_btn.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/notes_section.dart';

class OthersNotesView extends StatelessWidget {
  const OthersNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Main content (app bar and notes)
          NotesSection(
            section: otherSection,
          ),
          // Add new note (FloatingActionButton)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 60), // Move the button up by 50 pixels
              child: CustomAddNoteFloatingActionBtn(
                boxName: otherSection,
                title: 'Add New Notes',
              ),
            ),
          ),
        ],
      ),
    );
  }
}