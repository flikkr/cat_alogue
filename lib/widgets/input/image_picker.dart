import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class ImagePicker extends StatelessWidget {
  final bool isCircle;
  final double? height;
  final double? width;
  final Widget? child;
  final Function()? onTap;
  final String? initialImagePath;

  const ImagePicker({
    Key? key,
    this.isCircle = false,
    this.height,
    this.width,
    this.child,
    this.onTap,
    this.initialImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return initialImagePath == null
        ? DottedBorder(
            borderType: BorderType.RRect,
            radius: isCircle ? StiloBorderRadius.full : StiloBorderRadius.xl,
            color: Colors.grey,
            dashPattern: const [8, 5],
            strokeWidth: 2,
            child: SizedBox(
              height: height ?? 150,
              width: width ?? 150,
              child: Material(
                clipBehavior: Clip.hardEdge,
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: onTap,
                  child: Center(
                    child: child,
                  ),
                ),
              ),
            ),
          )
        : showImage();
  }

  Widget showImage() {
    return SizedBox(
      height: height ?? 150,
      width: width ?? 150,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          child: Image.file(
            File(initialImagePath!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
