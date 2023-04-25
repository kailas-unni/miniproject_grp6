import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool _expanded = false;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: _toggleExpansion,
    );
  }

  Widget _buildExpandedContent() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            // Handle search submit
          },
        ),
      ],
    );
  }

  @override
  Widget build1(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        AppBar(
          title: Text('My App'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _toggleExpansion,
            ),
          ],
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: SizedBox.shrink(),
          secondChild: Container(
            color: Colors.grey[200],
            child: _buildExpandedContent(),
          ),
          crossFadeState:
              _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ],
    );
  }
}
