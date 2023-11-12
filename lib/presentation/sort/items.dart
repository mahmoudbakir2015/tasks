import 'package:flutter/material.dart';

SizedBox buildSortItmes(
    {required String text, void Function()? onTap, required isActive}) {
  return SizedBox(
    width: double.infinity,
    height: 40,
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          if (isActive == true)
            const Icon(
              Icons.check,
              size: 17,
              color: Colors.blue,
            ),
        ],
      ),
    ),
  );
}
