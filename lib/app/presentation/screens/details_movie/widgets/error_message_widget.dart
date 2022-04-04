import 'package:detailsmovie/app/core/constants/app_text.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;

  const ErrorMessageWidget({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Text(
        message,
        style: AppText.title,
      ),
    );
  }
}
