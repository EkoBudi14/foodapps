part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Jakarta', 'Depok', 'Bogor'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Address",
      subtitle: "Enter your personal information",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 26, defaultMargin, 6),
            child: Text(
              "Phone",
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
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter your Phone Number"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 16, defaultMargin, 6),
            child: Text(
              "Address",
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
              controller: addressController,
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
              "House Number",
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
              controller: houseNumController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Enter your House Number"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(43, 16, defaultMargin, 6),
            child: Text(
              "City",
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
            child: DropdownButton(
              value: selectedCity,
              isExpanded: true,
              underline: SizedBox(),
              items: cities
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: blackFontStyle3,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
            ),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.only(top: 36),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : RaisedButton(
                    onPressed: () async {
                      User user = widget.user.copyWith(
                        phoneNumber: phoneController.text,
                        address: addressController.text,
                        houseNumber: houseNumController.text,
                        city: selectedCity,
                      );

                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);

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
