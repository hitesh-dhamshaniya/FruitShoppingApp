import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_order_app/src/screen/sub_category.dart';

// ignore: must_be_immutable
class FruitPage extends StatefulWidget {
  String passName;

  FruitPage(this.passName);

  @override
  _FruitPageState createState() => _FruitPageState(passName);
}

class _FruitPageState extends State<FruitPage> {
  String mPrice;

  _FruitPageState(String price) {
    this.mPrice = price;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildFoodCard(
            "assets/mango.png",
            "Rs: 500 " + mPrice,
            "Mango, Mangifera indica, is an evergreen tree in the family Anacardiaceae grown for its edible fruit. The mango tree is erect and branching with a thick trunk and broad, rounded canopy. The leaves of the tree are are shiny and dark green.",
            '0xFF57874E')
      ],
    );
  }

  Widget _buildFoodCard(
      String imagePath, String price, String desc, String cardBackColor) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          _showSubCategory();
        },
        child: Container(
          height: MediaQuery.of(context).size.width - 50,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.amberAccent[200]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildImage(imagePath),
                SizedBox(height: 10.0),
                _buildPrice(price),
                SizedBox(height: 10.0),
                _buildDescription(desc)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrice(String price) {
    return Text(
      price,
      style: TextStyle(
          fontFamily: 'Quicksand', fontSize: 20.0, color: Colors.white),
    );
  }

  Widget _buildDescription(String description) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Text(description,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontFamily: 'Quicksand')),
    );
  }

  Widget _buildImage(String imgPath) {
    return Image.asset(imgPath,
        fit: BoxFit.scaleDown, height: 200.0, width: 200.0);
  }

  Future _showSubCategory() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SubCategoryPage();
    }));
  }
}
