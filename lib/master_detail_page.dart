import 'package:flutter/material.dart';
import 'detail_widget.dart';
import 'list_widget.dart';



class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 480) {
          return Row(children: <Widget>[
            Expanded(
              child: ListWidget((value) {
                setState(() {selectedValue = value;});
              }),
            ),
            Expanded(child: DetailWidget(selectedValue)),
          ]);

        } else {
          return ListWidget((value) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(),
                  body: DetailWidget(value),
                );
              },
            ));

          });
        }
      }),
    );
  }
}
