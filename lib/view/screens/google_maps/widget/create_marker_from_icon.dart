import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> createMarkerFromIcon(
    Icon icon, {
      Color? color,
      double? fontSize,
    }) async {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);

  final double iconSize = 80.sp;
  final Size size = Size(iconSize, iconSize);

  final TextPainter painter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  painter.text = TextSpan(
    text: String.fromCharCode(icon.icon!.codePoint),
    style: TextStyle(
      fontSize: fontSize ?? 70.sp,
      fontFamily: icon.icon!.fontFamily,
      package: icon.icon!.fontPackage,
      color: color ?? Colors.black,
    ),
  );

  painter.layout();

  final Offset centerOffset = Offset(
    (size.width - painter.width) / 2,
    (size.height - painter.height) / 2,
  );

  painter.paint(canvas, centerOffset);

  final img = await pictureRecorder
      .endRecording()
      .toImage(size.width.toInt(), size.height.toInt());

  final data = await img.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}

