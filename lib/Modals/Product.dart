class Photo {

  final String image;
  final String title;
  final String category;
  final String description;
  final int id;
  final num price;

  const Photo({

    required this.title,
    required this.image,
    required this.category,
    required this.description,
    required this.id,
    required this.price,

  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(

        image: json['image'] as String,
        title :json['title'] as String,
        category: json['category'],
        description: json['description'],
        id: json['id'],
      price: json['price']

    );
  }
}