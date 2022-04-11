part of 'widgets.dart';

class ProfileList extends StatelessWidget {
  final String textKet;

  ProfileList({this.textKet});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: defaultMargin),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              textKet,
              style: greyFontStyle.copyWith(fontSize: 15),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(right: defaultMargin),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/ic_right_arrow.png"))),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
          ),
        ),
      ],
    );
  }
}
