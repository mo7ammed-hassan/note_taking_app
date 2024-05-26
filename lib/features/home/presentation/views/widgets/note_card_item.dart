import 'package:flutter/material.dart';
import 'package:note_taking_app/core/models/note_card_item_model.dart';
import 'package:note_taking_app/core/utils/app_text_styls.dart';
import 'package:note_taking_app/core/utils/widgets/custom_container.dart';
import 'package:note_taking_app/features/home/presentation/views/widgets/note_card_image.dart';

class NoteCardItem extends StatelessWidget {
  const NoteCardItem({
    super.key,
    required this.noteModel,
  });
  final NoteCardItemModel noteModel;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NoteCardItemImage(
            image: noteModel.image,
          ),
          const SizedBox(height: 14),
          Text(
            noteModel.title,
            style: AppTextStyles.textStyle16ExtraBold,
          ),
          Text(
            '${noteModel.files} Files',
            style: AppTextStyles.textStyle16SemiBold,
          ),
          Text(
            'Size: ${noteModel.files} GB',
            style: AppTextStyles.textStyle10Medium,
          ),
        ],
      ),
    );
  }
}
