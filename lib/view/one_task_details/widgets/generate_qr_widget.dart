import 'package:custom_qr_generator_2/custom_qr_generator.dart';
import 'package:flutter/material.dart';

Widget generateQrWidget({dynamic id}) {
  return Center(
    child: CustomPaint(
      // painter: Painter(),
      painter: QrPainter(
          data: id,
          options: QrOptions(
              shapes: QrShapes(
                  lightPixel: QrPixelShapeRoundCorners(cornerFraction: .5),
                  darkPixel: QrPixelShapeRoundCorners(cornerFraction: .5),
                  frame: QrFrameShapeRoundCorners(cornerFraction: .25),
                  ball: QrBallShapeRoundCorners(cornerFraction: .25)),
              colors: const QrColors(
                background: QrColorSolid(Colors.transparent),
                dark: QrColorSolid(Colors.black),
              ))),
      size: const Size(350, 350),
    ),
  );
}
