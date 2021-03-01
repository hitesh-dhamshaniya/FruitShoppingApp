import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SummaryWidget extends StatelessWidget {
  double cartValue;
  double taxes;
  bool hasCoupon;
  double deliveryCharge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            "Summary",
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
          SizedBox(height: 16.0),
          getSummaryRow("Cart Value", 999.0),
          getSummaryRow("Discount", 99.0),
          getSummaryRow("Tex", 0.0),
          getSummaryRow("Delivery charges", 0.0)
        ],
      ),
    );
  }

  Widget getSummaryRow(String title, double value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
          Text(
            value.toString(),
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
