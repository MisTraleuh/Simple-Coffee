/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopSection extends StatelessWidget {
  final String logoPath;
  final String shopName;
  final String shopAddress;

  const ShopSection({
    Key? key,
    required this.logoPath,
    required this.shopName,
    required this.shopAddress,
  }) : super(key: key);

  Future<void> _launchMapsUrl(String address) async {
    String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$address";
    final Uri url = Uri.parse(googleMapsUrl);

    if (!await launchUrl(url)) {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 150.0, left: 15.0, right: 15.0),
      child: SizedBox(
        width: screenWidth - 20,
        height: 185,
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                    child: Image.asset(
                      logoPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                shopName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                shopAddress,
                style: TextStyle(
                  fontSize: shopAddress.length >  52 ? 11 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _launchMapsUrl(shopAddress);
                    },
                    child: const Text(
                      'Trouver le commerce',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 14 , 101 , 93),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      color: const Color.fromARGB(255, 14 , 101 , 93),
                      icon: const Icon(Icons.location_on_outlined),
                      onPressed: () async {
                        await _launchMapsUrl(shopAddress);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}