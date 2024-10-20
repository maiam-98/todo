import 'package:flutter/material.dart';


class TextTap extends StatelessWidget {
  const TextTap(
      this.context,
      this.onPressed,
      {
        Key? key,
        required this.fixedText,
        required this.textTap,
        required this.colorTap,
      }) : super(key: key);

  final BuildContext context;
  final Function()? onPressed;
  final String fixedText;
  final String textTap;
  final Color colorTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            fixedText,
            style: const TextStyle(color: Colors.black87,),
          ),
          InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 5,),
              child: Text(
                textTap,
                style: TextStyle(
                    color: colorTap,
                  fontSize: 17
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
