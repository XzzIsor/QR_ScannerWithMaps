import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/UI_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
   
    return BottomNavigationBar(
      onTap: (value) => uiProvider.pageSelected = value,
      currentIndex: uiProvider.pageSelected,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.maps_ugc), label: 'Mapa'),
        BottomNavigationBarItem(icon: Icon(Icons.router_rounded), label: 'URL')
      ],
    );
  }
}
