import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mango_order_app/src/screen/fruit_page.dart';
import 'package:mango_order_app/src/util/ScrollBehaviorUtil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
            behavior: AppScrollBehaviour(), child: child);
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.grey,
                onPressed: () {},
              ),
              Container(
                height: 50.0,
                width: 300.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.grey,
                onPressed: () {},
              ) // shopping cart icon
            ],
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "All Fruits",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              tabs: <Widget>[
                setTab("Mango"),
                setTab("Banana"),
                setTab("Chicho"),
                setTab("Orange")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height - 200,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                FruitPage("Mango"),
                FruitPage("Banana"),
                FruitPage("Orange"),
                FruitPage("Graps")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget setTab(String tabTitle) {
    return Tab(
        child: Text(tabTitle,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold)));
  }
}
