import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
   SocialMedia({Key? key}) : super(key: key);
  List<String> iconSocial = [
  'assets/icons/facebook.png',
  'assets/icons/google.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width / 3.5, vertical: 10),
      width: double.infinity,
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey.shade300,
                spreadRadius: 1,
                offset: (const Offset(0, 1)),
              )
            ],
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image(
              height: 30,
              image: AssetImage(
                  iconSocial[index]
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: 2,
      ),
    );
  }
}
