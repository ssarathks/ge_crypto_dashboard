import 'package:flutter/material.dart';
import 'package:ge_task/constants/color_constants.dart';
import 'package:ge_task/constants/constants.dart';
import 'package:ge_task/constants/theme_constants.dart';

import '../../widgets/common_search_bar.dart';
import '../../widgets/horizontal_scroll_card.dart';
import '../../widgets/wallet/tokens_list_tile.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ThemeConstants.scaffoldHorizontalPadding),
              child: Text(
                "Wallet",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: ThemeConstants.scaffoldHorizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Mobile Team",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.unfold_more,
                    size: 14,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 65,
              child: buildHorizontalScrollFeatures(),
            ),
            TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).textTheme.headline6?.color,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: ThemeConstants.scaffoldHorizontalPadding),
                isScrollable: true,
                unselectedLabelColor: Colors.grey.shade700,
                tabs: const [
                  Tab(
                    text: "Tokens",
                  ),
                  Tab(
                    text: "Leasing",
                  ),
                ]),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ThemeConstants.scaffoldHorizontalPadding),
              height: 300,
              child: TabBarView(controller: _tabController, children: [
                buildTokensContainer(context),
                const Center(
                  child: Text("No leasing data found"),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ThemeConstants.scaffoldHorizontalPadding),
              child: ExpansionPanelList(
                elevation: 0,
                dividerColor: ColorConstants.getScaffoldColor(context),
                children: [
                  ExpansionPanel(
                      backgroundColor: ColorConstants.getScaffoldColor(context),
                      headerBuilder: (context, isExpanded) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hidden tokens (2)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                      body: const Text("Hello"),
                      isExpanded: false),
                  ExpansionPanel(
                      backgroundColor: ColorConstants.getScaffoldColor(context),
                      headerBuilder: (context, isExpanded) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Suspicious tokens (15)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                      body: const Text("Hello"),
                      isExpanded: false)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildHorizontalScrollFeatures() {
    List<Map> horizontalScrollFeature = [
      {
        "label": "Your address",
        "labelColor": Colors.white,
        "icon": const Icon(
          Icons.qr_code_sharp,
          color: Colors.white,
        ),
        "color": Colors.blue.shade700
      },
      {
        "label": "Aliases",
        "icon": const Icon(Icons.person_outline_outlined),
      },
      {
        "label": "Balance",
        "icon": const Icon(Icons.toggle_on_outlined),
      },
      {
        "label": "Refund",
        "icon": const Icon(Icons.compare_arrows_outlined),
      },
    ];
    return ListView.builder(
        itemCount: horizontalScrollFeature.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
                left: Constants.scaffoldHorizontalPadding),
            child: HorizontalScrollCard(
              horizontalScrollItem: horizontalScrollFeature[index],
            ),
          );
        });
  }

  buildTokensContainer(BuildContext context) {
    List<Map> tokensData = [
      {
        'label': "Waves",
        "value": "5.0054",
        "avatarBgColor": Colors.white,
        "badgeIcon": Icons.check,
        "avatarContentWidget": Icon(
          Icons.diamond,
          color: Colors.blue.shade900,
        )
      },
      {
        'label': "Pigeon/My Token",
        "value": "1444.04556321",
        "avatarBgColor": Colors.brown.shade700,
        "badgeIcon": Icons.unfold_more,
        "avatarContentWidget": const Text(
          "P",
          style: TextStyle(color: Colors.white),
        )
      },
      {
        'label': "US Dollar",
        "value": "199.24",
        "avatarBgColor": Colors.green.shade300,
        "badgeIcon": Icons.check,
        "avatarContentWidget": const Text(
          "\$",
          style: TextStyle(color: Colors.white, fontSize: 25),
        )
      },
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CommonSearcBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tokensData
                  .map((token) => TokensListTile(tokenData: token))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
