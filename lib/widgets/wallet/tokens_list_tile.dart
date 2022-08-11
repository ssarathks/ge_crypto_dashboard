import 'package:flutter/material.dart';

class TokensListTile extends StatelessWidget {
  final Map tokenData;
  const TokensListTile({Key? key, required this.tokenData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: tokenData['avatarBgColor'],
                      child: tokenData['avatarContentWidget'],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 1,
                      child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                          child: Icon(
                            tokenData['badgeIcon'],
                            size: 10,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tokenData['label'],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      tokenData['value'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
