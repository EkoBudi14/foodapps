part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transactions.length == 0) {
          return IllustrationPage(
            title: "What are you cravings ?",
            subtitle: "lets see and find your favorite food",
            picturePath: "assets/ic_food.png",
            buttonTap1: () {},
            buttonTitle1: "Order Now",
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return RefreshIndicator(
            onRefresh: () async {
              await context.bloc<TransactionCubit>().getTransactions();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Order",
                            style: blackFontStyle1,
                          ),
                          Text(
                            "wait for the best meal",
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),

                    //ANCHOR: BODY
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ['In Progress', 'Past Order'],
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
                          Builder(builder: (_) {
                            List<Transaction> transactions =
                                (selectedIndex == 0)
                                    ? state.transactions
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.on_delivery ||
                                            element.status ==
                                                TransactionStatus.pending)
                                        .toList()
                                    : state.transactions
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.delivered ||
                                            element.status ==
                                                TransactionStatus.cancelled)
                                        .toList();

                            return Column(
                              children: transactions
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (e.status ==
                                                TransactionStatus.pending) {
                                              await launch(e.paymentUrl);
                                            }
                                          },
                                          child: OrderListItem(
                                              transaction: e,
                                              itemWidth: listItemWidth),
                                        ),
                                      ))
                                  .toList(),
                            );
                          }),
                          SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
