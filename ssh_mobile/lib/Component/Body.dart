import 'package:flutter/material.dart';
import 'package:ssh_mobile/Component/BotNavBar.dart';
import 'package:ssh_mobile/constant.dart';

import 'Categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Categories",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(color: Colors.blue),
        )
      ],
    );
  }
}
