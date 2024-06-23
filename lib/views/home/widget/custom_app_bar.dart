import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  final dynamic x;
  final dynamic y, z;

  const CustomAppBar(
      {super.key, required this.x, required this.y, required this.z});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: x,
        ),
        const Spacer(),
        y,
        z
      ],
    );
  }
}
