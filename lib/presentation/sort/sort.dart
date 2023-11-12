import 'package:flutter/material.dart';
import 'package:tasks/constants/styles.dart';
import 'package:tasks/presentation/sort/items.dart';

import '../../core/widgets/header.dart';

class Sort extends StatefulWidget {
  const Sort({
    super.key,
  });

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  int selected = 0;
  List sortItem = [
    'Our recommendation',
    'Rating & Recommendation',
    'Price & Recommendation',
    'Distance & Recommendation',
    'Rating only',
    'Price only',
    'Distance only',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Styles.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            context,
            text: 'Sort by',
            isFilter: false,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildSortItmes(
                text: sortItem[index],
                onTap: () {
                  print('tapped $selected');
                  selected = index;
                  setState(() {});
                },
                isActive: selected == index,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: sortItem.length,
          ),
        ],
      ),
    );
  }
}
