part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        // ANCHOR : HEADER
        Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MiseFood",
                        style: blackFontStyle1.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Let’s find your favorite food",
                        style: greyFontStyle.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(
                                (context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            // ANCHOR : LIST FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.foods
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == state.foods.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(FoodDetailPage(
                                            transaction: Transaction(
                                              food: e,
                                              user: (context
                                                      .bloc<UserCubit>()
                                                      .state as UserLoaded)
                                                  .user,
                                            ),
                                            onBackButtonPressed: () {
                                              Get.back();
                                            },
                                          ));
                                        },
                                        child: FoodCard(e),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      )
                    : Center(
                        child: loadingIndicator,
                      ),
              ),
            ),
            // ANCHOR : LIST FOOD (TABS)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['New Taste', 'Popular', 'Recommended'],
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
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded) {
                      List<Food> foods = state.foods
                          .where((element) =>
                              element.types.contains((selectedIndex == 0)
                                  ? FoodType.new_food
                                  : (selectedIndex == 1)
                                      ? FoodType.popular
                                      : FoodType.recommended))
                          .toList();

                      return Column(
                          children: foods
                              .map((e) => Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        defaultMargin, 0, defaultMargin, 16),
                                    child: FoodListItem(
                                      food: e,
                                      itemWidth: listItemWidth,
                                    ),
                                  ))
                              .toList());
                    } else {
                      return Center(
                        child: loadingIndicator,
                      );
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ],
    );
  }
}
