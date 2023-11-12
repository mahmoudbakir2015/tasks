import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/constants.dart';
import '../../constants/styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customButton(
            text: 'Filters',
            icon: Icons.filter_1_outlined,
            onPressed: () {},
          ),
          customButton(
            text: 'Filters',
            icon: Icons.filter_1_outlined,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

Expanded customButton({
  required String text,
  required IconData icon,
  required void Function()? onPressed,
}) {
  return Expanded(
    child: IconButton(
      onPressed: onPressed,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),
  );
}

class Rating extends StatelessWidget {
  final dynamic rating;
  final String text;
  const Rating({
    super.key,
    required this.rating,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating.toDouble(),
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
        Center(
          child: Text(text),
        ),
      ],
    );
  }
}

Row buildSubDetails(
    {required dynamic rating, required String grade, required String farAway}) {
  return Row(
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 35,
            height: 20,
            child: Center(
              child: Text(
                '$rating ',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(grade),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
      Row(
        children: [
          const Icon(Icons.location_on),
          const SizedBox(
            width: 5,
          ),
          Text(farAway),
        ],
      ),
    ],
  );
}

class CustomCardItem extends StatelessWidget {
  final String name;
  final dynamic stars;
  final dynamic price;
  final String image;
  final dynamic reviewScore;
  final String review;
  final String address;
  const CustomCardItem({
    super.key,
    required this.name,
    required this.stars,
    required this.price,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(image: image),
          Padding(
            padding: EdgeInsets.only(
                top: Styles.appPadding, left: Styles.appPadding),
            child: Rating(
              rating: stars,
              text: 'Hotel',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Styles.appPadding, left: Styles.appPadding),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Styles.appPadding, left: Styles.appPadding),
            child: buildSubDetails(
              rating: reviewScore,
              grade: review,
              farAway: address,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Styles.appPadding),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(Styles.appPadding)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffBEE0EC),
                              borderRadius:
                                  BorderRadius.circular(Styles.appPadding),
                            ),
                            height: 30,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'our lowest Price',
                              ),
                            ),
                          ),
                          Text(
                            '''\$ $price''',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            name,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        onTap: () {},
                        title: const Text(
                          'View Deal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          weight: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'More Prices',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container buildImage({required String image}) {
  return Container(
    height: 150,
    width: double.infinity,
    color: Colors.red,
    child: Image(
      fit: BoxFit.cover,
      image: NetworkImage(
        image,
      ),
    ),
  );
}
