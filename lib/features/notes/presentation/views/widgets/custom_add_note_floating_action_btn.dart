import 'package:flutter/material.dart';
import 'package:note_taking_app/core/utils/app_colors.dart';
import 'package:note_taking_app/core/utils/app_text_styles.dart';
import 'package:note_taking_app/features/notes/presentation/views/widgets/add_note_view.dart';

class CustomAddNoteFloatingActionBtn extends StatelessWidget {
  const CustomAddNoteFloatingActionBtn({
    super.key,
    required this.title,
    required this.boxName,
  });
  final String title;
  final String boxName;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNoteView(
              boxName: boxName,
            ),
          ),
        );
      },
      label: Text(
        title,
        style: AppTextStyles.textStyle16ExtraBold
            .copyWith(fontSize: 14, color: Colors.white),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
