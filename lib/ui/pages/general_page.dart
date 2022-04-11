part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColor;
  final Image imageIcon;

  GeneralPage({
    this.title = "Title",
    this.subtitle = "Subtitle",
    this.onBackButtonPressed,
    this.child,
    this.backColor,
    this.imageIcon,
  });

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
              color: backColor ?? "FFCA0C".toColor(),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 90,
                      color: "FFDB5C".toColor(),
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButtonPressed != null) {
                                      onBackButtonPressed();
                                    }
                                  },
                                  child: Container(
                                    width: 38,
                                    height: 38,
                                    margin:
                                        EdgeInsets.only(right: defaultMargin),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/ic_left_arrow.png")),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                subtitle,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: imageIcon,
                    ),
                    child ?? SizedBox(),
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
