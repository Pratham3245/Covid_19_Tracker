import 'package:auto_size_text/auto_size_text.dart';

import '../../screens/symptoms_page.dart';
import '../../screens/stats_dashboard_screens/world_stat.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryTab extends StatelessWidget {
  final imgPath, tabName, tabDesc, imgHeight, imgLeft, imgBottom;
  final Color color;
  final AutoSizeGroup titleGrp, descGrp;

  const CategoryTab(
      {this.imgPath,
      this.tabName,
      this.color,
      this.tabDesc,
      this.imgHeight = 150.0,
      this.imgLeft = 15.0,
      this.imgBottom = -8.0,
      this.titleGrp,
      this.descGrp});

  Function getPage(tabName, context) {
    switch (tabName) {
      case ("Symptoms"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SymptomsScreen(color: color, imgPath: imgPath)));
      // case ("Precautions"):
      //   return () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) =>
      //           PrecautionsScreen(color: color, imgPath: imgPath)));
      // case ("Myths"):
      //   return () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => MythsScreen(color: color, imgPath: imgPath)));
      // case ("Virus"):
      //   return () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) =>
      //           VirusDetailsScreen(color: color, imgPath: imgPath)));

      case ("Statistics"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WorldStatScreen()));
    }
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getPage(tabName, context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 250,
        child: Stack(
          children: <Widget>[
            //Title Container
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 170),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withOpacity(0.13),
                  ),
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AutoSizeText(
                        "$tabName",
                        style: TextStyle(
                          color: color,
                          fontFamily: "Montserrat",
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                        ),
                        stepGranularity: 1,
                        maxFontSize: 23,
                        maxLines: 1,
                        group: titleGrp,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: imgLeft,
              bottom: imgBottom,
              child: Container(
                height: imgHeight,
                child: Hero(
                    tag: imgPath, child: Image(image: AssetImage(imgPath))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
