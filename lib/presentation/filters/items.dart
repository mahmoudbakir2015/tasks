import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/styles.dart';

Column chooseRate({required List rating}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildBoldText(text: 'RATING'),
      SizedBox(
        width: double.infinity,
        height: 40,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return chooseRateItem(
                color: rating[index]['color'], rate: rating[index]['rating']);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 40,
            );
          },
          itemCount: rating.length,
        ),
      ),
    ],
  );
}

Container chooseRateItem({required Color color, required String rate}) {
  return Container(
    color: color,
    width: 50,
    child: Center(
        child: Text(
      '$rate+',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    )),
  );
}

SizedBox choosePrice() {
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
                width: 60,
                height: 40,
                child: const Center(
                  child: Text(
                    r'540+ $',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
          ),
        ),
      ],
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

Column chooseStarsRate({required List numStars}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildBoldText(text: 'HOTEL CLASS'),
      buildStarsItem(numStars: numStars),
    ],
  );
}

buildStarsItem({required List numStars}) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(
              Styles.appPadding,
            ),
          ),
          child: Center(
            child: RatingBar.builder(
              initialRating: numStars[index].toDouble(),
              minRating: 1,
              itemSize: 16,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: numStars[index].toInt(),
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
      itemCount: numStars.length,
    ),
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
