import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:qr_scanner/models/scan_model.dart';

launchURL(BuildContext context, ScanModel scanModel) async {
  
  if (scanModel.type =="http"){ 
    final url = scanModel.value;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }else{
    Navigator.pushNamed(context, "map", arguments: scanModel );
  }
}
