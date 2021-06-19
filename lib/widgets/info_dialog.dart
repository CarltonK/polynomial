import 'package:flutter/material.dart';
import 'package:polynomial/utilities/utilities.dart';

class InfoDialog extends StatelessWidget {
  final String detail;
  final String buttonText;
  final VoidCallback buttonPressed;

  const InfoDialog({
    Key? key,
    this.buttonText = 'Cancel',
    required this.detail,
    required this.buttonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: Constants.padding,
            top: Constants.avatarRadius + Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding,
          ),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                detail,
                style: Constants.blackBoldNormal.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: buttonPressed,
                  child: Text(
                    buttonText,
                    style: Constants.kPositiveButtonStyle.copyWith(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                const Radius.circular(Constants.avatarRadius),
              ),
              child: SizedBox(
                height: 150,
                width: 150,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
