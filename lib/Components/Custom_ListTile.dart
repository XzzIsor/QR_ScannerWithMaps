import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String value;
  final Function function;
  final bool loading;
  CustomListTile({this.value, this.function, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Card(
            child: ListTile(
              title: Text(value),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: function,
              ),
            ),
          )
        : Card(
            child: ListTile(
              title: Center(child: CircularProgressIndicator()),
            ),
          );
  }
}
