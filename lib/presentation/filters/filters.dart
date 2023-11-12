import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tasks/constants/styles.dart';
import 'package:tasks/presentation/filters/items.dart';
import '../../core/widgets/header.dart';

// ignore: must_be_immutable
class Filters extends StatefulWidget {
  const Filters({
    super.key,
  });

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  double startPrice = 20;
  List<Map<String, dynamic>> rating = [
    {
      'rating': '0',
      'color': Colors.red,
    },
    {
      'rating': '7',
      'color': Colors.orangeAccent,
    },
    {
      'rating': '7.5',
      'color': Colors.lightGreen,
    },
    {
      'rating': '8',
      'color': Colors.greenAccent,
    },
    {
      'rating': '8.5',
      'color': Colors.green,
    },
  ];

  List<double> numStars = [
    1.5,
    2,
    3,
    4,
    5,
  ];

  var items = [
    'City Center',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String dropdownvalue = 'City Center';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Styles.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context, text: 'Filters'),
          choosePrice(
            onChanged: (double value) {
              setState(() {
                startPrice = value;
              });
            },
            value: startPrice,
          ),
          chooseNumRate(
            rating: rating,
          ),
          const SizedBox(
            height: 20,
          ),
          chooseStarsRate(
            numStars: numStars,
          ),
          const SizedBox(
            height: 20,
          ),
          chooseAddress(context: context, value: dropdownvalue),
          const Spacer(),
          buildFooter(),
        ],
      ),
    );
  }

  Column chooseAddress({required BuildContext context, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBoldText(text: 'DISTANCE FROM'),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: dropdownvalue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownvalue = value!;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
