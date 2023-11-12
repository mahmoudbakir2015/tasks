class TestModel {
  String? name;
  dynamic starts;
  dynamic price;
  String? currency;
  String? image;
  dynamic reviewScore;
  String? review;
  String? address;

  TestModel(
      {this.name,
      this.starts,
      this.price,
      this.currency,
      this.image,
      this.reviewScore,
      this.review,
      this.address});

  TestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    starts = json['starts'];
    price = json['price'];
    currency = json['currency'];
    image = json['image'];
    reviewScore = json['review_score'];
    review = json['review'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['starts'] = starts;
    data['price'] = price;
    data['currency'] = currency;
    data['image'] = image;
    data['review_score'] = reviewScore;
    data['review'] = review;
    data['address'] = address;
    return data;
  }
}
