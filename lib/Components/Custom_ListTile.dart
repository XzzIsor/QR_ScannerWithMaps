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
        ?  Dismissible(
          key: Key(widget.value),
          
          onDismissed: (direction) {
                setState(() {
                  widget.function(); 
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Eliminado")));
          },
          background: Container(color: Colors.red[900]),
          child: Card(
              child: ListTile(
                title: Text(widget.value),
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
