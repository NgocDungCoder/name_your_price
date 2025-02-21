import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfor {
  final String name;
  final int price;

  ProductInfor(this.name, this.price);
}

final products = [
  ProductInfor('Wireless Mouse', 8),
  ProductInfor('Keybroad', 5),
  ProductInfor('Camera', 8),
  ProductInfor('Speaker', 4),
  ProductInfor('Ipad', 1800),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _inputtedPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_currentProductIndex].name),
            const Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              width: 290,
              child: TextField(
                key: const Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _inputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result =
                      _inputtedPrice == products[_currentProductIndex].price
                          ? 'pass'
                          : 'fail';
                });
              },
              child: const Text('Check'),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: Text(
                _result,
                key: const Key('result'),
              ),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                onPressed: () {
                  _result = '';
                  setState(() {
                    if (_currentProductIndex < 4) {
                      _currentProductIndex++;
                    }
                  });
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
