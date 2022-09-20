import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/widgets/dialog/concatulations_dialog.dart';
import 'package:cat_alogue/widgets/dialog/confirm_dialog.dart';
import 'package:cat_alogue/widgets/dialog/media_dialog.dart';
import 'package:flutter/material.dart';

mixin Surround {
  void showConcatulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConcatulationsDialog(),
    );
  }

  Future<bool?> showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const ConfirmDialog(
        title: 'Delete cat',
        body: 'Are you sure you want to delete this cat? This action cannot be undone.',
      ),
    );
  }

  Future<List<MediaItem>?> showMediaPickerDialog(
    BuildContext context, {
    bool enableMultipleImagesFromGallery = false,
    bool enableSingleImageFromGallery = true,
    bool enableSingleVideoFromGallery = true,
    bool enableTakePhoto = true,
    bool enableTakeVideo = true,
  }) async {
    if (!enableMultipleImagesFromGallery &&
        !enableSingleImageFromGallery &&
        !enableSingleVideoFromGallery &&
        !enableTakePhoto &&
        !enableTakeVideo) {
      throw Exception('Atleast one option must be enabled');
    }
    return showDialog(
      context: context,
      builder: (context) => MediaDialog(
        enablePickMultipleImagesFromGallery: enableMultipleImagesFromGallery,
        enablePickSingleImageFromGallery: enableSingleImageFromGallery,
        enablePickSingleVideoFromGallery: enableSingleVideoFromGallery,
        enableTakePhoto: enableTakePhoto,
        enableTakeVideo: enableTakeVideo,
      ),
    );
  }
}
