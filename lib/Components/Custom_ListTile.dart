import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String value;
  final Function function;
  final bool loading;



  CustomListTile({this.value, this.function, @required this.loading});

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {


  @override
  Widget build(BuildContext context) {
    return !widget.loading
        ?  Card(
            child: ListTile(
              title: Text(widget.value),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: widget.function,
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
