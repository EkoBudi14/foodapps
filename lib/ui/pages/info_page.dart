part of 'pages.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: "FAFAFC".toColor(),
          ),
          SafeArea(
            child: Container(
              color: Colors.white ?? "FAFAFC".toColor(),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 90,
                      color: Colors.white,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              margin: EdgeInsets.only(right: defaultMargin),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/ic_left_arrow.png")),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "INFO APLIKASI",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "KELOMPOK 5",
                          style: blackFontStyle3.copyWith(fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Eko Budiarto",
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            "12118188 / 3KA14",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Jeremie Imanuel D.",
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            "13118474 / 3KA14",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Randini Oktaviani Savitri",
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            "15118893 / 3KA14",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Muhammad Ilyas",
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            "14118705 / 3KA14",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
