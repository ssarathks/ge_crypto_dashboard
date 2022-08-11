import 'package:flutter/material.dart';

class HorizontalScrollCard extends StatelessWidget {
  final Map horizontalScrollItem;
  const HorizontalScrollCard({Key? key, required this.horizontalScrollItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Card(
        color: horizontalScrollItem['color'],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              horizontalScrollItem['icon'],
              Text(horizontalScrollItem['label'],
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: horizontalScrollItem['labelColor']))
            ],
          ),
        ),
      ),
    );
  }
}
