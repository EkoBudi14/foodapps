part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign Up",
      subtitle: "Enter your personal information",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: 110,
              height: 110,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/photo_border.png"))),
              child: (pictureFile != null)
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(pictureFile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/photo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 40, defaultMargin, 6),
            child: Text(
              "Nama",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 43),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: "4A83B7".toColor(),
                )),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter your full name"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 16, defaultMargin, 6),
            child: Text(
              "Email",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 43),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: "4A83B7".toColor(),
                )),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter your email address"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 43),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: "4A83B7".toColor(),
                )),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter your password"),
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 36),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 35,
                    color: redColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      Get.to(AddressPage(
                          User(
                            name: nameController.text,
                            email: emailController.text,
                          ),
                          passwordController.text,
                          pictureFile));
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: redColor,
                    child: Text("Continue",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
