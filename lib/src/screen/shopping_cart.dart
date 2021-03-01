import 'package:flutter/material.dart';
import 'package:mango_order_app/src/widget/summary_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent[200]),
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    getItemAndValue("1 Item"),
                    getItemAndValue("₹999")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(60.0)),
                child: Container(
                  child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      elevation: 4.0,
                      child: Container(
                        height: 150.0,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: double.infinity,
                              color: Colors.amberAccent[100],
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/mango.png",
                                width: 150.0,
                              ),
                            ),
                            Container(
                                padding:
                                const EdgeInsets.only(left: 16.0, right: 8.0),
                                height: 150.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    getOrderItemTextView("Talala Gir Keshar"),
                                    getOrderItemTextView("₹999"),
                                  ],
                                )),
                          ],
                        ),
                      )),
                ),
              ),
              SummaryWidget(),
              SizedBox(height: 20.0),
              payButton,
            ],
          )),
    );
  }

  Widget get payButton {
    return Center(
      child: new RaisedButton(
          color: Colors.deepPurpleAccent[100],
          elevation: 4.0,
          padding: EdgeInsets.only(left: 124, right: 124, bottom: 16, top: 16),
          child: new Text(
            "Order now",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          onPressed: () {},
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Text getItemAndValue(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
    );
  }

  Widget getOrderItemTextView(String message) {
    return Text(
      message,
      style: TextStyle(fontSize: 20.0),
    );
  }
}