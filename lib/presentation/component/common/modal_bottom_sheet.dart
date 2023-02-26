import 'package:flutter/material.dart';

class ModalBottomSheet {
  bool isShown = false;
  void showModal(BuildContext context, Widget content) {
    if (!isShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            builder: (context) {
              return content;
            });
      });
      isShown = true;
    }
  }
}
