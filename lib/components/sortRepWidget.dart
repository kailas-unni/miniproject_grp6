import 'package:flutter/material.dart';
import 'package:notify_v1/repHome.dart';

class SortWidget extends StatefulWidget {
  final List<ClassItem> filteredList;
  final void Function(List<ClassItem> sortedItems) onSort;

  const SortWidget({
    Key? key,
    required this.filteredList,
    required this.onSort,
  }) : super(key: key);

  @override
  _SortWidgetState createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  int _sortIndex = 0;
  List<ClassItem> _sortedItems = [];

  void _sort() {
    setState(() {
      if (_sortIndex == 0) {
        _sortedItems = List.from(widget.filteredList)
          ..sort((a, b) => a.title.compareTo(b.title));
        _sortIndex = 1;
      } else if (_sortIndex == 1) {
        _sortedItems = List.from(widget.filteredList)
          ..sort((a, b) => b.title.compareTo(a.title));
        _sortIndex = 2;
      } else if (_sortIndex == 2) {
        _sortedItems = List.from(widget.filteredList)
          ..sort((a, b) => b.priority.compareTo(a.priority));
        _sortIndex = 3;
      } else if (_sortIndex == 3) {
        _sortedItems = List.from(widget.filteredList)
          ..sort((a, b) => a.submitiondate.compareTo(b.submitiondate));
        _sortIndex = 4;
      } else {
        _sortedItems = List.from(widget.filteredList);
        _sortIndex = 0;
      }
    });

    widget.onSort(_sortedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Text('Sort by:'),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize:
                Size(130, 35), // set the height and width of the button
          ),
          onPressed: _sort,
          child: Text(_sortIndex == 0
              ? 'Default'
              : _sortIndex == 1
                  ? 'Name (A-Z)'
                  : _sortIndex == 2
                      ? 'Name (Z-A)'
                      : _sortIndex == 3
                          ? 'Priority'
                          : 'Submition Date'),
        ),
      ],
    );
  }
}
