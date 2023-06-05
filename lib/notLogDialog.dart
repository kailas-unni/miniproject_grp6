import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:notify_v1/home.dart';

List<ListItem> filteredList = [];

class NotificationLogDialog extends StatefulWidget {
  final List<ListItem> items;

  const NotificationLogDialog({Key? key, required this.items})
      : super(key: key);

  @override
  State<NotificationLogDialog> createState() => _NotificationLogDialogState();
}

class _NotificationLogDialogState extends State<NotificationLogDialog> {
  int selectedIndex = 0;

  void _showDetails(BuildContext context, List<String> details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: SingleChildScrollView(
            child: Container(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: details.map((detail) {
                  return Text(detail);
                }).toList(),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onAddButtonPressed(BuildContext context) {
    final selectedListItem = widget.items[selectedIndex];
    Navigator.of(context).pop(selectedListItem);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Notification Log'),
      content: Container(
        width: double.maxFinite,
        height: 500.0,
        child: Column(
          children: [
            Expanded(
              child: DraggableScrollbarWidget(
                items: widget.items,
                selectedIndex: selectedIndex,
                showDetailsCallback: _showDetails,
                onIndexChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Add'),
          onPressed: () {
            _onAddButtonPressed(context);
          },
        ),
      ],
    );
  }
}

class DraggableScrollbarWidget extends StatefulWidget {
  final List<ListItem> items;
  final int selectedIndex;
  final Function(BuildContext, List<String>) showDetailsCallback;
  final Function(int) onIndexChanged;

  const DraggableScrollbarWidget({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.showDetailsCallback,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  _DraggableScrollbarWidgetState createState() =>
      _DraggableScrollbarWidgetState();
}

class _DraggableScrollbarWidgetState extends State<DraggableScrollbarWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.rrect(
      labelTextBuilder: (double offset) => Text("${offset ~/ 100}"),
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return GestureDetector(
            onTap: () {
              widget.onIndexChanged(index); // Update the selectedIndex
              // widget.showDetailsCallback(context, item.details);
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color:
                    widget.selectedIndex == index ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: widget.selectedIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
