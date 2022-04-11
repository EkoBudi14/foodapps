part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      color: mainColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ic_home" +
                        ((selectedIndex == 0) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 115),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ic_bag" +
                        ((selectedIndex == 1) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ic_person" +
                        ((selectedIndex == 2) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain),
              ),
            ),
          )
        ],
      ),
    );
  }
}
