part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'food';

    var response = await client.get(url);

    // String jsonsDataString = responseJson.toString();
    // var response = jsonDecode(jsonsDataString);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "please try again");
    }

    var data = jsonDecode(response.body);

    // debugPrint('data $data');

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
