part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      imageIcon: Image.asset("assets/ic_logo.png"),
      title: "Sign In",
      subtitle: "Lets find your favorite dish",
      backColor: "FFCA0C".toColor(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 50, defaultMargin, 6),
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
                  hintText: "Enter email address"),
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
              controller: passwordController,
              obscureText: _isHidePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Enter password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglePasswordVisibility();
                  },
                  child: Icon(
                    _isHidePassword ? Icons.visibility_off : Icons.visibility,
                    color: _isHidePassword ? Colors.grey : redColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password ?",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " Get Now",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: redColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 36),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signIn(
                          emailController.text, passwordController.text);
                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.bloc<FoodCubit>().getFoods();
                        context.bloc<TransactionCubit>().getTransactions();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign In Failed",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              (state as UserLoadingFailed).message,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: redColor,
                    child: Text("Sign In",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
          ),
          isLoading
              ? SpinKitFadingCircle(
                  size: 35,
                  color: redColor,
                )
              : Container(
                  width: 200,
                  margin: EdgeInsets.only(top: 16),
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: redColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: RaisedButton(
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text("Sign Up",
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
