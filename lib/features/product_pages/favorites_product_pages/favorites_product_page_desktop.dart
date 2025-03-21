import 'package:flutter/material.dart';

class FavoritesProductPageDesktop extends StatefulWidget {

  const FavoritesProductPageDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesProductPageDesktop> createState() => _FavoritesProductPageDesktopState();
}

class _FavoritesProductPageDesktopState extends State<FavoritesProductPageDesktop> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text('Favorites Product Page'),
      ),
    );
  }
}