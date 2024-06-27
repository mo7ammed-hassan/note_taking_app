import 'package:flutter/material.dart';
import 'package:note_taking_app/core/utils/app_text_styles.dart';
import 'package:note_taking_app/core/utils/image_assets.dart';
import 'package:note_taking_app/core/utils/widgets/custom_container.dart';
import 'package:note_taking_app/features/home/presentation/views/widgets/note_card_image.dart';

class NoteCardItem extends StatelessWidget {
  const NoteCardItem({
    super.key,
    //required this.noteModel,
    required this.titlee,
  });
  //final NoteCardItemModel noteModel;
  final String titlee;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 171, maxHeight: 171),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 5,
          shadowColor: const Color(0xffeae7fd),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: CustomContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NoteCardItemImage(
                  //image: noteModel.image,
                  image: Assets.imagesAcademic,
                ),
                const SizedBox(height: 14),
                Text(
                  titlee,
                  style: AppTextStyles.textStyle16ExtraBold,
                ),
                Text(
                  //'${noteModel.files} Files',
                  '200',
                  style: AppTextStyles.textStyle16SemiBold,
                ),
                Text(
                  // 'Size: ${noteModel.files} GB',
                  '200',
                  style: AppTextStyles.textStyle10Medium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
