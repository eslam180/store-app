class ProductModel {
  ProductModel({
    required this.id,
    required this.price,
    required this.image,
    required this.title,
    required this.description,
    required this.category,
    required this.rating,
  });

  final int id;
  final double price;
  final String image, title, description, category;
  final RatingModel? rating;

  factory ProductModel.fromjson(Map<String, dynamic> jsondata) {
    return ProductModel(
      id: jsondata['id'],
      price: (jsondata['price'] is String)
          ? double.parse(jsondata['price'])
          : (jsondata['price'] as num).toDouble(),

      image: jsondata['image'],
      title: jsondata['title'],
      description: jsondata['description'],
      category: jsondata['category'],
      rating: jsondata['rating'] == null
          ? null
          : RatingModel.fromjson(jsondata['rating']),
    );
  }
}

class RatingModel {
  RatingModel({required this.count, required this.rate});

  final int count;
  final double rate;

  factory RatingModel.fromjson(Map<String, dynamic> jsondata) {
    return RatingModel(
      count: jsondata['count'],
      rate: (jsondata['rate'] as num).toDouble(),
    );
  }
}
