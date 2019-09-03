import 'package:flutter/material.dart';

class OrientationDemo extends StatefulWidget {
  @override
  _OrientationDemoState createState() => _OrientationDemoState();
}

class _OrientationDemoState extends State<OrientationDemo> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout()
              : _buildHorizontalLayout();
        },
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      children: <Widget>[
        PeopleIconView(),
        Expanded(
          child: ItemListView(),
        )
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: PeopleIconView()
          ),
          Expanded(
            child: ItemListView(),
          ),
        ],
      ),
    );
  }
}


class PeopleIconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Icon(
        Icons.people_outline,
        size: 80.0,
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(30, (n) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Some text',
            style: TextStyle(fontSize: 25.0),
          ),
        );
      }),
    );
  }
}