import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scanProvider = Provider.of<ScanProvider>(context);
    
   
    return BottomNavigationBar(
      onTap: (value) => value == 0 ? _scanProvider.changeType('geo') : _scanProvider.changeType('http'), 
      currentIndex: _scanProvider.type == 'geo' ? 0 : 1,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.maps_ugc), label: 'Mapa'),
        BottomNavigationBarItem(icon: Icon(Icons.router_rounded), label: 'URL')
      ],
    );
  }
}
