import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_order_app/src/screen/fruit_detail_page.dart';
import 'package:mango_order_app/src/util/ScrollBehaviorUtil.dart';

class SubCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: AppScrollBehaviour(),
          child: child,
        );
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SubCategory(),
    );
  }
}

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mangoesō"),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Colors.amber,
      ),
      body: Container(child: _getGridView()),
    );
  }

  Widget _getGridView() {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: <Widget>[
          _getItemView(
              'Kesar Mango',
              "The 'Gir Kesar' mango, also called Kesar, is a mango cultivar grown in the foothills of Girnar in Gujarat, western India. The mango is known for its bright orange colored pulp and was given the geographical indication status in 2011.",
              "assets/keshar_mango.png"),
          _getItemView(
              'Alphonso Mango',
              "They have a rich, creamy, tender texture and delicate, non-fibrous, juicy pulp. The skin of a fully ripe Alphonso mango turns bright golden-yellow with a tinge of red which spreads across the top of the fruit. The flesh of the fruit is saffron-colored. These characteristics make Alphonso a favored cultivar.",
              "assets/alphonso_mango.png"),
        ]);
  }

  Widget _getItemView(String title, String shortDescription, String imagePath) {
    return Card(
      elevation: 4.0,
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FruitDetailPage(),
              ));
            },
            child: Container(
                width: double.infinity,
                color: Colors.amberAccent[600],
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    _buildImage(imagePath),
                    Text(
                      title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      shortDescription,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget _buildImage(String imgPath) {
    return Image.asset(imgPath,
        fit: BoxFit.scaleDown, height: 200.0, width: double.infinity);
  }
}
