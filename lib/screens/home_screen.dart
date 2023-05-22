import 'package:analog_clock_flutter/screens/components.dart/body.dart';
import 'package:analog_clock_flutter/screens/search_zone.dart';
import 'package:analog_clock_flutter/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Settings.svg",
              theme: SvgTheme(currentColor: Theme.of(context).iconTheme.color!),
            )),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18)),
            child: InkResponse(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchZone();
                  },
                ));
              },
              child: Container(
                width: getProportionateScreenWidth(32),
                /*decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),*/
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
