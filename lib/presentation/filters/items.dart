import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/styles.dart';

SizedBox choosePrice(
    {required void Function(double)? onChanged, double value = 20}) {
  return SizedBox(
    width: double.infinity,
    height: 180,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Styles.appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBoldText(text: 'PRICE PER NIGHT'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Styles.appPadding),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                width: 70,
                height: 50,
                child: Center(
                  child: Text(
                    '$value+ \$',
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Slider(
          min: 20,
          value: value,
          max: 540,
          divisions: 5,
          label: value.round().toString(),
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCustomTextPrice(text: '20'),
            buildCustomTextPrice(text: '540'),
          ],
        ),
      ],
    ),
  );
}

Text buildCustomTextPrice({required String text}) {
  return Text(
    '\$ $text',
    style: const TextStyle(
      color: Colors.grey,
    ),
  );
}

Padding buildBoldText({required String text}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Styles.appPadding),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Column chooseNumRate({
  required List rating,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildBoldText(text: 'HOTEL CLASS'),
      RateNumItem(
        rating: rating,
      ),
    ],
  );
}

Column chooseStarsRate({
  required List numStars,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildBoldText(text: 'HOTEL CLASS'),
      StarsItem(
        numStars: numStars,
      ),
    ],
  );
}

SizedBox buildFooter() {
  return SizedBox(
    width: double.infinity,
    height: 70,
    child: Expanded(
      child: Padding(
        padding: EdgeInsets.all(Styles.appPadding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff007BC1),
          ),
          onPressed: () {},
          child: const Text('Show result'),
        ),
      ),
    ),
  );
}

class StarsItem extends StatefulWidget {
  final List numStars;
  const StarsItem({super.key, required this.numStars});

  @override
  State<StarsItem> createState() => _StarsItemState();
}

class _StarsItemState extends State<StarsItem> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
              active = index;
            },
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(
                    color: active == index ? Colors.black : Colors.amber),
                borderRadius: BorderRadius.circular(
                  Styles.appPadding,
                ),
              ),
              child: Center(
                child: RatingBarIndicator(
                  rating: widget.numStars[index].toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: widget.numStars[index].toInt(),
                  itemSize: 12,
                  direction: Axis.horizontal,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 30,
          );
        },
        itemCount: widget.numStars.length,
      ),
    );
  }
}

class RateNumItem extends StatefulWidget {
  final List rating;
  const RateNumItem({super.key, required this.rating});

  @override
  State<RateNumItem> createState() => _RateNumItemState();
}

class _RateNumItemState extends State<RateNumItem> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
              active = index;
            },
            child: Container(
              decoration: BoxDecoration(
                color: widget.rating[index]['color'],
                border: active == index ? Border.all() : null,
              ),
              width: 50,
              child: Center(
                  child: Text(
                '${widget.rating[index]['rating']}+',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 30,
          );
        },
        itemCount: widget.rating.length,
      ),
    );
  }
}
