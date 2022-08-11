import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddFeatureSheet extends StatelessWidget {
  List<Map> features = [
    {'label': "Send", 'iconData': Icons.arrow_upward, 'color': Colors.orange},
    {
      'label': "Receive",
      'iconData': Icons.arrow_downward,
      'color': Colors.green
    },
    {
      'label': "Exchange",
      'iconData': Icons.compare_arrows_rounded,
      'color': Colors.purple
    },
    {
      'label': "QR Scan",
      'iconData': Icons.qr_code_scanner_sharp,
      'color': Colors.indigo
    },
  ];
  AddFeatureSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: features[index]['color'][50],
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: features[index]['color'][300]),
                            ),
                            child: Icon(
                              features[index]['iconData'],
                              color: features[index]['color'][300],
                            )),
                      ),
                      title: Text(features[index]['label']),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  );
                }),
          ),
          Container(
              height: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close)))
        ],
      ),
    );
  }
}
