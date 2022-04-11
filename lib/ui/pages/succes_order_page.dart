part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Yay, your order completed",
        subtitle:
            "now you able to find some foods\nand order again as a self reward ",
        picturePath: "assets/ic_people_hungry.png",
        buttonTap1: () {
          Get.offAll(MainPage());
        },
        buttonTitle1: "Order Other Foods",
        buttonTap2: () {
          Get.offAll(MainPage(
            initialPage: 1,
          ));
        },
        buttonTitle2: "View my order",
      ),
    );
  }
}
