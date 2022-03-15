import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

var multiMediaPickerProvider = StateNotifierProvider.autoDispose
    .family<MultiMediaPickerProvider, List<MediaItem>, List<MediaItem>?>(
  (ref, mediaList) {
    return MultiMediaPickerProvider(mediaList);
  },
);

class MultiMediaPickerProvider extends StateNotifier<List<MediaItem>> {
  MultiMediaPickerProvider(List<MediaItem>? state) : super(state ?? []);

  Future<void> removeMediaItem(String resourceUrl) async {
    throw UnimplementedError();
  }

  Future<void> pickPhotos() async {
    final images = await ImagePicker().pickMultiImage(imageQuality: 50);

    if (images == null) return;

    final mappedImages = images
        .map((img) => MediaItem(
              urlPath: img.path,
              type: MediaType.image,
              source: MediaSource.local,
            ))
        .toList();

    state = [...state, ...mappedImages];
  }

  Future<void> pickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video == null) return;

    state = [
      ...state,
      MediaItem(
        urlPath: video.path,
        type: MediaType.video,
        source: MediaSource.local,
      ),
    ];
  }

  Future<void> takePhoto() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
    );

    if (image == null) return;

    state = [
      ...state,
      MediaItem(
        urlPath: image.path,
        type: MediaType.image,
        source: MediaSource.local,
      ),
    ];
  }

  Future<void> takeVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.camera);

    if (video == null) return;

    state = [
      ...state,
      MediaItem(
        urlPath: video.path,
        type: MediaType.image,
        source: MediaSource.local,
      ),
    ];
  }
}
