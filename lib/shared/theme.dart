part of 'shared.dart';

const double defaultMargin = 24;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 35,
  color: redColor,
);

Color mainColor = "FFCA0C".toColor();
Color redColor = "FF6C25".toColor();
Color blueColor = "4A83B7".toColor();
Color greyColor = "8D92A3".toColor();
Color blackColor = "000000".toColor();

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: blackColor);
