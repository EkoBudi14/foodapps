part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  IllustrationPage({
    @required this.title,
    @required this.subtitle,
    @required this.picturePath,
    @required this.buttonTap1,
    this.buttonTap2,
    this.buttonTitle1,
    this.buttonTitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(picturePath),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: blackFontStyle3.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: RaisedButton(
              onPressed: buttonTap1,
              color: redColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                buttonTitle1,
                style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: redColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: RaisedButton(
                    onPressed: buttonTap2,
                    color: Colors.transparent,
                    splashColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      buttonTitle2,
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
