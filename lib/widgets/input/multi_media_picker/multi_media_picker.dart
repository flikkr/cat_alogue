import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/screens/encounter_detail/encounter_media_tile.dart';
import 'package:cat_alogue/widgets/input/multi_media_picker/multi_media_picker_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';

class MultiMediaPicker extends ConsumerWidget {
  final List<MediaItem>? mediaList;

  const MultiMediaPicker({
    Key? key,
    this.mediaList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(multiMediaPickerProvider(mediaList).notifier);
    final resources = ref.watch(multiMediaPickerProvider(mediaList));

    return GridView.count(
      key: key,
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      shrinkWrap: true,
      children: [
        ...resources.map((resource) => EncounterMediaTile(mediaItem: resource)),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: StiloBorderRadius.md,
            color: Colors.grey,
            dashPattern: const [8, 5],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: StiloBorderRadius.allMd,
              child: Material(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.video_file_outlined),
                              title: const Text('Select images from gallery'),
                              horizontalTitleGap: 0,
                              onTap: () {
                                provider.pickPhotos();
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.video_file_outlined),
                              horizontalTitleGap: 0,
                              title: const Text('Select video from gallery'),
                              onTap: () {
                                provider.pickVideo();
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera_alt_outlined),
                              horizontalTitleGap: 0,
                              title: const Text('Take photo'),
                              onTap: () {
                                provider.takePhoto();
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading:
                                  const Icon(Icons.video_camera_back_outlined),
                              horizontalTitleGap: 0,
                              title: const Text('Take video'),
                              onTap: () {
                                provider.takeVideo();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.upload_sharp,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                        Text(
                          'Add video/image',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: StiloFontSize.lg,
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
