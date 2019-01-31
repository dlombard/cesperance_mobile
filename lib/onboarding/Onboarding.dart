import 'package:flutter/material.dart';
import 'PageViewModel.dart';
import '../App_localizations.dart';
import 'Pages.dart';
import 'PageIndicator.dart';
import '../StitchChannel.dart';
StitchChannel _stitchChannel = new StitchChannel();

class Onboarding extends StatefulWidget {
  @override
  OnboardingState createState() => new OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  int page = 0;
  bool isDone = false;
  final controller = PageController(initialPage: 0);
  Color currentColor = Color(0xFF548CFF);

  @override
  Widget build(BuildContext context) {

      final pages = [
        PageViewModel(
            Color(0xFF548CFF),
            "assets/onboarding/017-smartphone-1.png",
            AppLocalizations.of(context).newDesign,
            AppLocalizations.of(context).newDesignDescription),
        PageViewModel(
            Color(0xFFE4534D),
            "assets/onboarding/004-loupe-2.png",
            AppLocalizations.of(context).searchOnboarding,
            AppLocalizations.of(context).searchOnboardingDescription),
        PageViewModel(
            Color(0xFFFF682D),
            "assets/onboarding/016-smartphone.png",
            AppLocalizations.of(context).instantUpdates,
            AppLocalizations.of(context).instantUpdatesDescription),
        PageViewModel(
            Color(0xFFC5E48C),
            "assets/onboarding/009-light-bulb.png",
            AppLocalizations.of(context).suggestionsOnboarding,
            AppLocalizations.of(context).suggestionsOnboardingDescription)
      ];

    return Scaffold(
        backgroundColor: pages[page].color,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            FlatButton(
              child: isDone ? Icon(Icons.done, color: Colors.white, ) : Icon(Icons.navigate_next, color: Colors.white),
              onPressed: isDone
                  ? () {

                      _stitchChannel.setOnboarding(true);
                      Navigator.of(context).pushReplacementNamed("/app");
                    }
                  : () {
                      controller.animateToPage(page + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
            )
          ],
        ),
        body: Stack(children: <Widget>[
          PageView.builder(
            controller: controller,
            physics: new AlwaysScrollableScrollPhysics(),
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return Pages(viewModel: pages[index]);
            },
            onPageChanged: (int p) {
              setState(() {
                currentColor = pages[p].color;
                page = p;
                p == pages.length - 1 ? isDone = true : isDone = false;
              });
            },
          ),
          Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: new SafeArea(
                  child: new Column(children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageIndicator(
                    controller: controller,
                    itemCount: pages.length,
                    onPageSelected: (int page) {
                      controller.animateToPage(
                        page,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                )
              ])))
        ]));
  }
}
