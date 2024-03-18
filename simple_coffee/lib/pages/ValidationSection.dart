/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';
import 'package:simple_coffee/commons/DoubleValues.dart';
import 'package:simple_coffee/commons/SingleKeyValue.dart';

class ValidationSection extends StatefulWidget {
  final VoidCallback onConfirm;
  final VoidCallback onPanik;
  final String collectDate;
  final String collectTime;
  final String collectNumberBasket;
  final String collectBasketType;
  final String collectPrice;

  const ValidationSection({
    Key? key,
    required this.onConfirm,
    required this.onPanik,
    required this.collectDate,
    required this.collectTime,
    required this.collectNumberBasket,
    required this.collectBasketType,
    required this.collectPrice,
    }) : super(key: key);

  @override
  State<ValidationSection> createState() => _ValidationSectionState();
}

class _ValidationSectionState extends State<ValidationSection> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
  
    return SizedBox(
        width: screenWidth - 20,
        height: 386,
        child: CustomBackgroundDrawer(
          backgroundColor: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: 10,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Je récupère la",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 14 , 101 , 93),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 48.0),
                          child: Text(
                            "commande",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 14 , 101 , 93),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 30.0, right: 30.0),
                          child: Container(
                            height: 3,
                            color: const Color.fromARGB(255, 14, 101, 93),                     
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onPanik,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10.0, right: 20.0),
                      child: Text(
                        "Demander à un ami",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: DoubleValues(
                  firstTitle: "DATE",
                  firstValue: widget.collectDate,
                  secondTitle: "HEURE DE COLLECTE",
                  secondValue: widget.collectTime,
                ),
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: DoubleValues(
                  firstTitle: "PANIER SURPRISE",
                  firstValue: '${widget.collectNumberBasket} x ${widget.collectBasketType}',
                  secondTitle: "TOTAL",
                  secondValue: '${widget.collectPrice} €',
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: SingleKeyValue(
                  title: "EMBALLAGE",
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final int numberOfDashes = constraints.maxWidth ~/ 10;
                    final String dashes = List.filled(numberOfDashes, '- ').join();

                    return Text(
                      dashes,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 142, 142, 142),
                      ),
                      overflow: TextOverflow.visible,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 7.0),
                child: SizedBox(
                  height: 45,
                  width: screenWidth - 90,
                  child: ElevatedButton(
                    onPressed: widget.onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 14, 101, 93),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Confirmer la réservation",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}