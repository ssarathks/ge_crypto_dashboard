import 'package:flutter/material.dart';

class CommonSearcBar extends StatelessWidget {
  const CommonSearcBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Card(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color.fromARGB(255, 27, 27, 27)
                      : Color.fromARGB(255, 220, 224, 228),
              elevation: 0,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // TextField(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.filter_list,
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}
