import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(3),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(94, 92, 229, 1),
                  borderRadius: BorderRadiusDirectional.circular(80)),
            ),
            Container(
                padding: const EdgeInsets.all(3),
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(94, 92, 229, 1),
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                        bottomStart: Radius.circular(80)))),
          ],
        ),
        Container(
          height: 80,
          width: 40,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(94, 92, 229, 1),
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(90),
                  topEnd: Radius.circular(90))),
        )
      ],
    );
  }
}
