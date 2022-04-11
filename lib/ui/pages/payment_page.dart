part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPageWhite(
      title: "Payment",
      subtitle: "pay less get more delicious",
      onBackButtonPressed: () {},
      backColor: "FAFAFC".toColor(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Item Ordered", style: blackFontStyle3),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                    widget.transaction.food.picturePath),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 189,
                              // 2 * defaultMargin ()
                              // 60 - (lebar picture)
                              // 12 - (jarak picture ke title)
                              // 78, ( lebar jumlah items)
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0,
                              ).format(widget.transaction.food.price),
                              style: greyFontStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '${widget.transaction.quantity} items',
                      style: greyFontStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 8),
                  child: Text(
                    "Detail Transaction",
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.food.name,
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0)
                            .format(widget.transaction.total),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Deliver Fee",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0)
                            .format(5000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Tax 10%",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0)
                            .format(widget.transaction.total * 0.1),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Total",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0)
                            .format(widget.transaction.total * 1.1 + 5000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Deliver to:", style: blackFontStyle3),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Name",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.name,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Phone",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.phoneNumber,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Address",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.address,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "House",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.houseNumber,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Town",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.city,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ANCHOR : CHECKOUT BUTTON
          (isLoading)
              ? Center(
                  child: loadingIndicator,
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String paymentURL = await context
                          .bloc<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total * 1.1).toInt() +
                                  5000));

                      if (paymentURL != null) {
                        Get.to(PaymentMethodPage(paymentURL));
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9453E".toColor(),
                          icon: Icon(MdiIcons.closeCircleOutline,
                              color: Colors.white),
                          titleText: Text(
                            'Transaction Failed',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          messageText: Text("Please try again later.",
                              style: GoogleFonts.poppins(color: Colors.white)),
                        );
                      }
                    },
                    elevation: 0,
                    color: redColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Checkout Now",
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
