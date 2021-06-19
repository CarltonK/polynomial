import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polynomial/widgets/widgets.dart';

Future dialogInfo(BuildContext context, String message) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => AlertDialog(
      content: InfoDialog(
        buttonPressed: () => Navigator.of(context).pop(),
        detail: message,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
