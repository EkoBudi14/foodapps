part of 'pages.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    width: 120,
                    height: 120,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            (context.bloc<UserCubit>().state as UserLoaded)
                                .user
                                .picturePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    (context.bloc<UserCubit>().state as UserLoaded).user.name,
                    style: blackFontStyle2.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    (context.bloc<UserCubit>().state as UserLoaded).user.email,
                    style: greyFontStyle.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabBar(
                titles: ['Account', 'MiseFood'],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              selectedIndex == 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: Text(
                                    "Edit Profile",
                                    style: blackFontStyle3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: Text(
                                    "Home Address",
                                    style: blackFontStyle3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: Text(
                                    "Security",
                                    style: blackFontStyle3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: Text(
                                    "Payment",
                                    style: blackFontStyle3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await context.bloc<UserCubit>().logOut();

                                      UserState state =
                                          context.bloc<UserCubit>().state;

                                      if (state is UserLoaded) {
                                        Get.to(SignInPage());
                                      }
                                    },
                                    child: Text(
                                      "Log Out",
                                      style: blackFontStyle3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: Text(
                                    "Rate App",
                                    style: blackFontStyle3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24, bottom: 8),
                                  child: Text(
                                    "Help Center",
                                    style: blackFontStyle3,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(InfoPage());
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 24, bottom: 15),
                                    child: Text(
                                      "Info",
                                      style: blackFontStyle3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/ic_right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
            ],
          ),
        ),
      ],
    );
  }

  // void logout() async {
  //   var res = await Network().getData('/logout');
  //   var body = json.decode(res.body);
  //   if (body['success']) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.remove('user');
  //     localStorage.remove('token');
  //     Get.to(SignInPage());
  //   }
  // }
}
