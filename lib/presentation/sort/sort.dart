import 'package:flutter/material.dart';

class Sort extends StatelessWidget {
  const Sort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ],
    );
  }
}
