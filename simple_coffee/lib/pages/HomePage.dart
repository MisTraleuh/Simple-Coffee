/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*       SHOP IMPORTS     *
**************************/
import 'package:simple_coffee/pages/shops/MarieBlachereComedie.dart';
import 'package:simple_coffee/pages/shops/PaulPolygone.dart';
import 'package:simple_coffee/pages/shops/LesFromentiers.dart';
import 'package:simple_coffee/pages/shops/Grilladoc.dart';
import 'package:simple_coffee/pages/shops/CheezyPizza.dart';
import 'package:simple_coffee/pages/shops/Pokawa.dart';
import 'package:simple_coffee/pages/shops/LaSucree.dart';
import 'package:simple_coffee/pages/shops/SushiShop.dart';
import 'package:simple_coffee/pages/shops/DominosPizza.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTimeStart;
  TimeOfDay? selectedTimeEnd;
  int quantity = 1;
  double price = 0.0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTimeStart(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeStart ?? TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTimeStart) {
      setState(() {
        selectedTimeStart = pickedTime;
      });
    }
  }

  Future<void> _selectTimeEnd(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeEnd ?? TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTimeEnd) {
      setState(() {
        selectedTimeEnd = pickedTime;
      });
    }
  }

Future<void> _selectPrice(BuildContext context) async {
    final TextEditingController priceController = TextEditingController();
    priceController.text = price.toString();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Price'),
          content: TextField(
            controller: priceController,
            decoration: const InputDecoration(
              hintText: 'Price',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  price = double.tryParse(priceController.text) ?? 0.0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  String toFormatDate(String dateStringNumber) {
    if (dateStringNumber == 'No Date Selected') {
      return dateStringNumber;
    }
    List<String> dateList = dateStringNumber.split('-');
    List<String> monthNames = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];
    int monthIndex = int.parse(dateList[0]) - 1;
    return '${dateList[1][0] == "0" ? dateList[1][1] : dateList[1]} ${monthNames[monthIndex]}';
  }

  @override
  Widget build(BuildContext context) {
    String dateStringNumber = selectedDate != null ? '${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}' : 'No Date Selected';
    String dateString = toFormatDate(dateStringNumber);
    String timeStringStart = selectedTimeStart != null ? selectedTimeStart!.format(context) : 'No Time Selected';
    String timeStringEnd = selectedTimeEnd != null ? selectedTimeEnd!.format(context) : 'No Time Selected';
    String timeString = (timeStringStart == 'No Time Selected' || timeStringEnd == 'No Time Selected') ?
                          'No Time Selected' : '${timeStringStart} - ${timeStringEnd}';
    String quantityString = quantity.toString();
    String priceString = price.toStringAsFixed(2);

    List<Widget> shops = [
      MarieBlachereComedie(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      PaulPolygone(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      LesFromentiers(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      Grilladoc(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      CheezyPizza(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      Pokawa(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      LaSucree(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      SushiShop(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
      DominosPizza(
        collectDate: dateString,
        collectTime: timeString,
        collectNumberBasket: quantityString,
        collectPrice: priceString,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Too Bad To Go'),
        ),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text(selectedDate == null
                ? 'Select Date'
                : 'Date: ${selectedDate!.toIso8601String().split('T').first}'
              ),
          ),
          ElevatedButton(
            onPressed: () => _selectTimeStart(context),
            child: Text(selectedTimeStart == null
                ? 'Select Time Start'
                : 'Time Start: ${selectedTimeStart!.format(context)}'
              ),
          ),
          ElevatedButton(
            onPressed: () => _selectTimeEnd(context),
            child: Text(selectedTimeEnd == null
                ? 'Select Time End'
                : 'Time End: ${selectedTimeEnd!.format(context)}'
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _decrementQuantity,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.remove),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('$quantity', style: const TextStyle(fontSize: 20)),
              ),
              ElevatedButton(
                onPressed: _incrementQuantity,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.add),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => _selectPrice(context),
            child: Text('Price: ${price.toStringAsFixed(2)} €'),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.only(top: 20, left: 2, right: 2),
              children: List<Widget>.from(shops),
            ),
          ),
        ],
      ),
    );
  }
}
