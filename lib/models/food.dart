part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data["id"],
      picturePath: data["picturePath"],
      name: data["name"],
      description: data["description"],
      ingredients: data["ingredients"],
      price: data["price"],
      rate: (data["rate"] as num).toDouble(),
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recommended;

            break;
          case 'popular':
          return FoodType.popular;
            break;
          default:
          return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          "https://pic3.iqiyipic.com/image/20201022/51/af/a_100426783_m_601_en_480_270.webp",
      name: "Sate Marrangi 1",
      description: "Sate ini adalah sate daging dengan sambal yang sangat pedas.",
      ingredients: "Daging, Bawang merah, Cabe, Tomat",
      price: 100000,
      rate: 4.5,
      types: [FoodType.new_food, FoodType.recommended, FoodType.popular]),
  Food(
      id: 2,
      picturePath:
          "https://pic3.iqiyipic.com/image/20201022/51/af/a_100426783_m_601_en_480_270.webp",
      name: "Sate Marrangi 2",
      description:
          "Sate ini adalah sate daging dengan sambal yang sangat pedas.",
      ingredients: "Daging, Bawang merah, Cabe, Tomat",
      price: 100000,
      rate: 4.5),
  Food(
      id: 3,
      picturePath:
          "https://pic3.iqiyipic.com/image/20201022/51/af/a_100426783_m_601_en_480_270.webp",
      name: "Sate Marrangi 3",
      description: "Sate ini adalah sate daging dengan sambal yang sangat pedas.",
      ingredients: "Daging, Bawang merah, Cabe, Tomat",
      price: 100000,
      rate: 4.5,
      types: [FoodType.recommended]),
  Food(
      id: 4,
      picturePath:
          "https://pic3.iqiyipic.com/image/20201022/51/af/a_100426783_m_601_en_480_270.webp",
      name: "Sate Marrangi 4",
      description: "Sate ini adalah sate daging dengan sambal yang sangat pedas.",
      ingredients: "Daging, Bawang merah, Cabe, Tomat",
      price: 100000,
      rate: 4.5,
      types: [FoodType.new_food]),
];
