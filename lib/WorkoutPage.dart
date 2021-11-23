import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final List<int> _items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Workout page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ReorderableListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _items.length,
        onReorder: (oldIndex, newIndex) => setState(() {
          final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

          final user = _items.removeAt(oldIndex);
          _items.insert(index, user);
        }),
        itemBuilder: (context, index) {
          return ListTile(
            key: Key('$index'),
            tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
            leading: Text('Item ${_items[index]}'),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Item ${_items[index]}'),
                Text('Item ${_items[index]}'),
              ],
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Item ${_items[index]}'),
                Text('Item ${_items[index]}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
