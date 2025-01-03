import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:tasky/core/shared/extension/extencion.dart';

import '../../../core/shared/Colors/colors.dart';
import '../../../core/shared/widget_shared/Navigator.dart';
import '../../create_task/view/create_task_screen.dart';
import '../../one_task_details/view/one_task_details_screen.dart';
Widget floatingButton({required context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r)),
          heroTag: 'scan',
          child: Icon(
            Icons.qr_code_scanner,
            color: mainColor,
          ),
          onPressed: () async {
            var res = await SimpleBarcodeScanner.scanBarcode(
              context,
              barcodeAppBar: const BarcodeAppBar(
                appBarTitle: 'Test',
                centerTitle: false,
                enableBackButton: true,
                backButtonIcon: Icon(Icons.arrow_back_ios),
              ),
              isShowFlashIcon: true,
              delayMillis: 2000,
              cameraFace: CameraFace.front,
            );
            Navigation().navigateTo(
                context: context,
                screenName: OneTaskDetailsScreen(id: res.toString()));
          }),
      10.ph,
      SizedBox(
        width: 70.w,
        height: 70.h,
        child: FloatingActionButton(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r)),
          heroTag: 'add',
          onPressed: () {
            Navigation()
                .navigateTo(context: context, screenName: CreateTaskScreen());
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
