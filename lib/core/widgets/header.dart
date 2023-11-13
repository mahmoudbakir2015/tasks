import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Card buildHeader(BuildContext context,
    {bool isFilter = true, required String text}) {
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isFilter
            ? TextButton(
                onPressed: () {},
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                  ),
                ),
              )
            : const Text(''),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
      ],
    ),
  );
}
