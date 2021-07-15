import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: StiloBorderRadius.xl,
      color: Colors.grey,
      dashPattern: const [8, 5],
      strokeWidth: 2,
      child: SizedBox(
        height: 100,
        width: 100,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
