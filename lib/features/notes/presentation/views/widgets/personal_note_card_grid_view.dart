import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_taking_app/core/utils/functions/delete_notes_show_dialog.dart';
import 'package:note_taking_app/features/notes/domain/entites/notes_entity.dart';
import 'package:note_taking_app/features/notes/presentation/manager/cubit/notes_cubit.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/custom_note_card.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/edit_note_view.dart';

class PersonalNotesCardGridView extends StatelessWidget {
  const PersonalNotesCardGridView({
    super.key,
    required this.section,
  });
  final String section;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesLoading ||
            state is AddNoteSuccess ||
            state is DeleteNoteSuccess) {
          BlocProvider.of<NotesCubit>(context).getAllNotes(boxName: section);
        }
      },
      builder: (context, state) {
        List<NotesEntity> notesList =
            BlocProvider.of<NotesCubit>(context).notes;
        return MasonryGridView.builder(
          padding: EdgeInsets.zero,
          itemCount: notesList.length,
          crossAxisSpacing: 3,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => CustomNoteCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNoteView(
                    boxName: section,
                    index: index,
                    notesEntity: notesList[index],
                  ),
                ),
              );
            },
            onLongPress: () async {
              await deleteNoteShowDialog(
                context: context,
                index: index,
                boxName: section,
              );
            },
            note: notesList[index],
          ),
        );
      },
    );
  }
}
