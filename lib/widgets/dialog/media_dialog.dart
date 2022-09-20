import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaDialog extends StatelessWidget {
  final bool enablePickMultipleImagesFromGallery;
  final bool enablePickSingleImageFromGallery;
  final bool enablePickSingleVideoFromGallery;
  final bool enableTakePhoto;
  final bool enableTakeVideo;

  const MediaDialog({
    super.key,
    this.enablePickMultipleImagesFromGallery = false,
    this.enablePickSingleImageFromGallery = true,
    this.enablePickSingleVideoFromGallery = true,
    this.enableTakePhoto = true,
    this.enableTakeVideo = true,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (enablePickMultipleImagesFromGallery)
            ListTile(
              leading: const Icon(Icons.image_outlined),
              title: const Text('Select images from gallery'),
              horizontalTitleGap: 0,
              onTap: () async {
                final photos = await pickMultiplePhotos();
                if (photos == null) return;
                navigator.pop(photos);
              },
            ),
          if (enablePickSingleImageFromGallery)
            ListTile(
              leading: const Icon(Icons.image_outlined),
              title: const Text('Select image from gallery'),
              horizontalTitleGap: 0,
              onTap: () async {
                final photo = await pickSinglePhoto();
                if (photo == null) return;
                navigator.pop([photo]);
              },
            ),
          if (enablePickSingleVideoFromGallery)
            ListTile(
              leading: const Icon(Icons.video_file_outlined),
              horizontalTitleGap: 0,
              title: const Text('Select video from gallery'),
              onTap: () async {
                final video = await pickVideo();
                if (video == null) return;
                navigator.pop([video]);
              },
            ),
          if (enableTakePhoto)
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              horizontalTitleGap: 0,
              title: const Text('Take photo'),
              onTap: () async {
                final photo = await takePhoto();
                if (photo == null) return;
                navigator.pop([photo]);
              },
            ),
          if (enableTakeVideo)
            ListTile(
              leading: const Icon(Icons.video_camera_back_outlined),
              horizontalTitleGap: 0,
              title: const Text('Take video'),
              onTap: () async {
                final video = await takeVideo();
                navigator.pop(video == null ? null : [video]);
              },
            ),
        ],
      ),
    );
  }

  Future<List<MediaItem>?> pickMultiplePhotos() async {
    final images = await ImagePicker().pickMultiImage(imageQuality: 50);
    if (images == null) return null;

    final mappedImages = images
        .map(
          (img) => MediaItem(
            urlPath: img.path,
            type: MediaType.image,
            source: MediaSource.local,
          ),
        )
        .toList();

    return mappedImages;
  }

  Future<MediaItem?> pickSinglePhoto() async {
    final image = await ImagePicker().pickImage(
      imageQuality: 50,
      source: ImageSource.gallery,
    );

    if (image == null) return null;

    return MediaItem(
      urlPath: image.path,
      type: MediaType.image,
      source: MediaSource.local,
    );
  }

  Future<MediaItem?> pickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video == null) return null;

    return MediaItem(
      urlPath: video.path,
      type: MediaType.video,
      source: MediaSource.local,
    );
  }

  Future<MediaItem?> takePhoto() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
    );

    if (image == null) return null;

    return MediaItem(
      urlPath: image.path,
      type: MediaType.image,
      source: MediaSource.local,
    );
  }

  Future<MediaItem?> takeVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.camera);

    if (video == null) return null;

    return MediaItem(
      urlPath: video.path,
      type: MediaType.image,
      source: MediaSource.local,
    );
  }
}
