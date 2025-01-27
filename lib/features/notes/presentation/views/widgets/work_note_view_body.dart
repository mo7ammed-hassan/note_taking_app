import 'package:flutter/material.dart';
import 'package:note_taking_app/core/utils/constants/boxes.dart';

import 'package:note_taking_app/features/notes/presentation/views/widgets/custom_note_app_bar.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/work_note_card_grid_view.dart';

class WorkNoteViewBody extends StatelessWidget {
  const WorkNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          // custom note app bar
          CustomNoteAppBar(
            title: workSection,
          ),
          SizedBox(
            height: 8,
          ),
          // notes section
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: WorkNoteCardGridView(
                section: workSection,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/**
 in future we should refactor code >>
 create builder widget to build which grid that i will return..
  
 */