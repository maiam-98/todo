import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.text,
      required this.context,
      required this.onPressed,
      this.isLoading = false})
      : super(key: key);
  final bool isLoading;
  final BuildContext context;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Container(
            margin: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height / 25, bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.red.shade400,
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        : Container(
            margin: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height / 25, bottom: 10),
            child: const CircularProgressIndicator(
              color: Colors.red,
            ),
          );
  }
}
