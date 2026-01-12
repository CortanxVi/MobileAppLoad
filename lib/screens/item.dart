import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int quantity = 10;

  void addQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  void substractQuantity() {
    setState(() {
      quantity = quantity <= 0 ? quantity = 0 : quantity -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // Text Widget ต้องไม่เป็น const เพราะมีการอ้างอิงค์ตัวแปรและมีการเปลี่ยนค่าของตัวแปร
            "$quantity",
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: addQuantity,
            child: const Text(
              "Increase",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          OutlinedButton(
            onPressed: substractQuantity,
            child: const Text(
              "Decrease",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Icon(
            Icons.arrow_back,
            color: Colors.red,
            size: 30,
            semanticLabel: 'Favorite',
          ),
        ],
      ),
    );
  }
}
