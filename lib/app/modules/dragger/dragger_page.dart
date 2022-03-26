import 'package:flutter/material.dart';

class DraggerPage extends StatefulWidget {
  DraggerPage({Key? key}) : super(key: key);

  @override
  State<DraggerPage> createState() => _DraggerPageState();
}

class _DraggerPageState extends State<DraggerPage> {
  final draggableChildren = [
    Container(
      color: Colors.green,
      height: 50,
      width: 50,
    ),
    Container(
      color: Colors.yellow,
      height: 50,
      width: 50,
    ),
    Container(
      color: Colors.red,
      height: 50,
      width: 50,
    ),
    Container(
      color: Colors.blue,
      height: 50,
      width: 50,
    ),
    Container(
      color: Colors.black,
      height: 50,
      width: 50,
    ),
    Container(
      color: Colors.brown,
      height: 50,
      width: 50,
    ),
    Container(
      color: Colors.purple,
      height: 50,
      width: 50,
    ),
  ];

  bool isDragging = false;

  setIsDraggin(bool value) => setState((() => isDragging = value));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: draggableChildren.length,
              itemBuilder: (context, index) {
                final childToBeMoved = draggableChildren[index];

                return DragTarget<Container>(
                  builder: (context, candidateData, rejectedData) {
                    return Opacity(
                      opacity: .5,
                      child: childToBeMoved,
                    );
                  },
                  onAccept: (child) {
                    final childIndex = draggableChildren.indexOf(child);

                    draggableChildren[index] = child;
                    draggableChildren[childIndex] = childToBeMoved;
                    setState(() {});
                  },
                );
              },
            ),
          ),
          if (!isDragging)
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: draggableChildren.length,
                itemBuilder: (context, index) {
                  return Opacity(
                    opacity: 1,
                    child: Draggable(
                      onDragStarted: () => setIsDraggin(true),
                      onDragEnd: (_) => setIsDraggin(false),
                      onDraggableCanceled: (_, __) => setIsDraggin(false),
                      onDragCompleted: () => setIsDraggin(false),
                      child: draggableChildren[index],
                      feedback: draggableChildren[index],
                      data: draggableChildren[index],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
