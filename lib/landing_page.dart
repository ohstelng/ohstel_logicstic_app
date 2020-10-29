import 'package:flutter/material.dart';
import 'package:ohstel_logicstic_app/food/food_orders_page.dart';
import 'package:ohstel_logicstic_app/market/all_market_orders_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FoodOrderPage(),
                  ),
                );
              },
              child: Text('Food'),
              color: Colors.green,
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllMarketOrderPage(),
                  ),
                );
              },
              child: Text('Market'),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
