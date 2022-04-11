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

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
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

List<Food> mockFood = [
  Food(
      id: 1,
      picturePath: "assets/pic_roti_bakar.png",
      name: "Toast",
      description:
          "Toast with a distinctive taste of MiseFood served with banana, cheese, and honey toppings suitable to be eaten in any weather conditions, making your mood happy.",
      ingredients: "Bread, Banana, Butter, Cheese, & Honey",
      price: 15000,
      rate: 4.2,
      types: [FoodType.new_food, FoodType.recommended, FoodType.popular]),
  Food(
      id: 2,
      picturePath: "assets/pic_banana.jpeg",
      name: "Grilled banana",
      description:
          "The taste of roasted banana that only MiseFood has, where all the ingredients used are selected ingredients.",
      ingredients: "banana, chocolate sauce, chocolate ,cheese & butter",
      price: 15000,
      rate: 4.2,
      types: [FoodType.new_food]),
  Food(
      id: 3,
      picturePath: "assets/pic_somay.jpeg",
      name: "Siomay",
      description:
          "Made with fresh fish and peanut sauce made with cashew nuts, makes it taste different from other siomay.",
      ingredients: "flour, fish, peanut sauce,salt",
      price: 15000,
      rate: 4.2,
      types: [FoodType.new_food]),
  Food(
      id: 4,
      picturePath: "assets/batagor.png",
      name: "Batagor",
      description:
          "Daging sapi Korea cincang yang disajikan mentah dan disiram saus spesial dengan toping kuning telur dan taburan biji wijen.",
      ingredients: "Daging Sapi Korea, Telur, Biji Wijen",
      price: 350000,
      rate: 3.4,
      types: [FoodType.recommended]),
  Food(
      id: 5,
      picturePath: "assets/pancong.jpg",
      name: "Pancong",
      description:
          "Daging sapi Korea cincang yang disajikan mentah dan disiram saus spesial dengan toping kuning telur dan taburan biji wijen.",
      ingredients: "Daging Sapi Korea, Telur, Biji Wijen",
      price: 350000,
      rate: 3.4,
      types: [FoodType.recommended]),
];
