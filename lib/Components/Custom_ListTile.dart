import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {  
  final String value;
  final Function cleanFunction;
  final Function onTap;
  final bool loading;
  CustomListTile({this.value, this.cleanFunction, @required this.loading, @required  this.onTap});
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
                  widget.cleanFunction();
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Eliminado")));
          },
          background: Container(color: Colors.red[900]),
          child: Card(
              child: ListTile(
                onTap: widget.onTap,
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
