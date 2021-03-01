import 'package:flutter/material.dart';
import 'package:mango_order_app/src/screen/shopping_cart.dart';
import 'package:mango_order_app/src/widget/DrawCircle.dart';

class FruitDetailPage extends StatefulWidget {
  @override
  _FruitDetailPageState createState() => _FruitDetailPageState();
}

class _FruitDetailPageState extends State<FruitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomPaint(painter: DrawCircle()),
      ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 4.0),
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Spacer(),
                  /*IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart, color: Colors.white))*/
                ],
              ),
              fruitImageAndNavButton,
            ],
          ),
          SizedBox(height: 16.0),
          itemNamePriceAndDescription,
          SizedBox(height: 16.0),
          itemNutritionValue,
          SizedBox(height: 16.0),
          addToCartButton,
        ],
      ),
    ]));
  }

  Widget get fruitImageAndNavButton {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Icon(Icons.navigate_before),
          Image.asset(
            "assets/mango.png",
            width: 280,
          ),
          //Icon(Icons.navigate_next),
        ],
      ),
    );
  }

  Widget get itemNamePriceAndDescription {
    return Column(
      children: <Widget>[
        Text(
          "Keshar Mango",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w800,
              fontSize: 32.0,
              letterSpacing: 1.5),
        ),
        SizedBox(height: 8),
        Text(
          "₹999/box",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Mango, Mangifera indica, is an evergreen tree in the family Anacardiaceae grown for its edible fruit. The mango tree is erect and branching with a thick trunk and broad, rounded canopy. The leaves of the tree are are shiny and dark green.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0, wordSpacing: 1.0, color: Colors.black45),
          ),
        )
      ],
    );
  }

  Widget get itemNutritionValue {
    return Column(
      children: <Widget>[
        Text(
          "Nutritional value",
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 20.0,
                )
              ],
              color: Colors.purple[100]),
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("89", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text("Calories",
                    style: TextStyle(color: Colors.white, fontSize: 14))
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.only(
              right: 16.0, left: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              getNutritionDetail("0.3 g", "Fat"),
              getNutritionDetail("23 g", "Carbohydrate"),
              getNutritionDetail("1.1 g", "Protine"),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Column getNutritionDetail(String value, String name) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Colors.black87),
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Colors.black54),
        ),
      ],
    );
  }

  Widget get addToCartButton {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 24.0, right: 24.0),
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent[100],
          borderRadius: BorderRadius.circular(30)),
      child: RaisedButton(
        onPressed: () {
          showBottomSheet();
        },
        elevation: 8.0,
        padding: EdgeInsets.all(16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        child: Text(
          "Add to Cart",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
        ),
        color: Colors.deepPurpleAccent[100],
      ),
    );
  }

  Future<void> showBottomSheet() {
    double _value = 5;
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "How much you want?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Slider(
                      value: _value,
                      max: 10,
                      min: 0,
                      onChanged: (value) {
                        setState(() => {_value = value});
                      }),
                  Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        navigateToCart();
                      },
                      color: Colors.deepPurpleAccent[100],
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void navigateToCart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ShoppingCartPage();
    }));
  }
}
