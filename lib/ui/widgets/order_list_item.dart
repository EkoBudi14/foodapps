part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({@required this.transaction, this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(transaction.food.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, // (60 + 12 + 120 )
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${transaction.quantity} item  " +
                    NumberFormat.currency(
                            symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                        .format(transaction.food.price),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTime(transaction.dateTime),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
              (transaction.status == TransactionStatus.cancelled)
                  ? Text(
                      'Canceled',
                      style: GoogleFonts.poppins(
                          color: 'D9435E'.toColor(), fontSize: 10),
                    )
                  : (transaction.status == TransactionStatus.pending)
                      ? Text(
                          'Pending',
                          style: GoogleFonts.poppins(
                              color: 'D9435E'.toColor(), fontSize: 10),
                        )
                      : (transaction.status == TransactionStatus.on_delivery)
                          ? Text(
                              'On Deliver',
                              style: GoogleFonts.poppins(
                                  color: '1ABC9C'.toColor(), fontSize: 10),
                            )
                          : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'jun';
        break;
      case 7:
        month = 'jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = "Des";
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
