import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorProvider extends ChangeNotifier {
  String _error;
  BuildContext _context;

  ErrorProvider(BuildContext context){
     _context = context; 
  }

  get error {
    return _error;
  }

  void cleanError(){
    _error = null;
    notifyListeners();
  }

  set error(String prmError) {
    _error = prmError;
    showAlert(_context); 
    notifyListeners();
  }

  void showAlert(BuildContext context) {
  if(_error != null){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
      elevation: 5.0,
      title: Text('ERROR'),
      content: Column(children : [Text(_error)], mainAxisSize: MainAxisSize.min),
      actions: [
        FlatButton(
            onPressed: () {
              cleanError();
              Navigator.of(context).pop();
            },
            child: Text('Aceptar'))
        ],
        );
       }
    );
  }
  }




}
