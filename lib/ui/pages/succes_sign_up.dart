part of 'pages.dart';

class SuccessSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Yeay! Registration Completed",
        subtitle: "Now you are able to order\nsome foods as a self-reward ",
        picturePath: "assets/ic_people_hungry.png",
        buttonTap1: () {},
        buttonTitle1: "Find Foods",
      ),
    );
  }
}
