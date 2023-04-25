import 'package:flutter/material.dart';
import 'package:notify_v1/home.dart';

class SortWidget extends StatefulWidget {
  final List<ListItem> items;
  final void Function(List<ListItem> sortedItems) onSort;

  const SortWidget({
    Key? key,
    required this.items,
    required this.onSort,
  }) : super(key: key);

  @override
  _SortWidgetState createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  int _sortIndex = 0;
  List<ListItem> _sortedItems = [];

  void _sort() {
    setState(() {
      if (_sortIndex == 0) {
        _sortedItems = List.from(widget.items)
          ..sort((a, b) => a.title.compareTo(b.title));
        _sortIndex = 1;
      } else if (_sortIndex == 1) {
        _sortedItems = List.from(widget.items)
          ..sort((a, b) => b.title.compareTo(a.title));
        _sortIndex = 2;
      } else {
        _sortedItems = List.from(widget.items);
        _sortIndex = 0;
      }
    });

    widget.onSort(_sortedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Sort by:'),
        ElevatedButton(
          onPressed: _sort,
          child: Text(
            _sortIndex == 0
                ? 'Name (A-Z)'
                : _sortIndex == 1
                    ? 'Name (Z-A)'
                    : 'Default',
          ),
        ),
      ],
    );
  }
}
