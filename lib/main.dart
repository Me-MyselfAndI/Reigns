import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reigns/card.dart';
import 'package:reigns/indicator.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int age = Random ().nextInt(10) + 13;

  Indicator army = Indicator ("Army", Icons.security);
  Indicator treasury = Indicator ("Treasury", Icons.attach_money);
  Indicator people = Indicator ("People", Icons.face);
  Indicator aristocracy = Indicator ("Aristocracy", Icons.bookmark_border);

  List <GameCard> cards = <GameCard> [
    GameCard('''Oh, bright king! The King of the West is visiting our great land. He wishes not to use our guards, and would rather be guarded by his army. Should we let foreign militia in our boarders?''', 'assets/Card0.PNG',
        IndicatorsEffect (dAristocracy: -5, dArmy: -10, dTreasury: 5), IndicatorsEffect(dPeople: 5, dTreasury: 5, dArmy: 10)),
    GameCard("Oh king, our knights have lost in a yearly tournament to the knights of the South. Should we blame the South in "
        "violation of the rules and declare that we won?", 'assets/Card1.PNG',
        IndicatorsEffect (dAristocracy: -5, dArmy: 10, dPeople: 15, dTreasury: -15), IndicatorsEffect(dPeople: -5, dArmy: -15, dTreasury: 5)),
    GameCard("My king! A terrible dragon is terrorizing our Northern lands. Should we send our "
        "knights to fight it?", 'assets/Card2.PNG',
        IndicatorsEffect (dArmy: -10, dPeople: 15, dTreasury: -10), IndicatorsEffect(dPeople: -15, dTreasury: 5, dArmy: 5)),
    GameCard("The Emperor of the East wishes to marry his daughter on our prince."
        " His daughter is very unpopular, but the army of the East is three times more powerful than ours, and we are likely "
        "to have problems if we refuse. Should we agree?", 'assets/Card3.PNG',
        IndicatorsEffect(dArmy: 5, dTreasury: 5, dPeople: -5, dAristocracy: -10), IndicatorsEffect(dAristocracy: 5, dPeople: 5, dTreasury: -5, dArmy: -15)),
    GameCard("Traders from the South created a conglomerate to displace our traders. Should we threaten the"
        " South with a war to force them to stop?", 'assets/Card4.PNG',
        IndicatorsEffect(dArmy: 10, dTreasury: 10, dPeople: 5, dAristocracy: -15), IndicatorsEffect (dAristocracy: -5, dPeople: -5, dTreasury: -10, dArmy: -5)),
    GameCard("My lord! We, the peasants, are gladly presenting you with our gifts. In exchange we"
        " only want representation in the legislation process.", "assets/Card5.PNG",
        IndicatorsEffect(dPeople: 90, dArmy: -15, dTreasury: 20, dAristocracy: -35), IndicatorsEffect(dAristocracy: 10, dTreasury: -5, dPeople: -10)),
    GameCard("Let the Lord bless you, our bright king! We, the clergy, want to spread our true faith to the Northern lands"
        " acquired by your wise father, let his soul rest in peace. Will you kindly allow us to punish those of the pagans "
        "who stubbornly persist in their falseness?", "assets/Card6.PNG", IndicatorsEffect (dArmy: -5, dPeople: -5, dAristocracy: 10), IndicatorsEffect (dArmy: 5, dAristocracy: -10)),
    GameCard("King, our allies from the Western Kingdom need our help! The lands on our shared boarder are being terrorized by"
        " bandits! Should we help them in this minute of need?", "assets/Card7.PNG", IndicatorsEffect(dAristocracy: 5, dArmy: 5, dPeople: 5, dTreasury: -15), IndicatorsEffect (dTreasury: -5, dPeople: -5, dAristocracy: -5)),
    GameCard("Lord, the great wizard wishes to give you his prophecy about prosperity of our land. Should he speak his"
        " mind? The clergy may not like it.", "assets/Card8.PNG", IndicatorsEffect (dAristocracy: -5, dPeople: -5, dTreasury: 20), IndicatorsEffect(dTreasury: -5, dPeople: -5, dAristocracy: 10)),
    GameCard("The barbars to the North from our kingdom are trying to take back the lands your"
        " wise father acquired. Should we send our troops to defend? The Northern lands are far, and it "
        "may be unhealthy for our treasury.", "assets/Card9.PNG", IndicatorsEffect(dPeople: 10, dArmy: -10, dTreasury: -15), IndicatorsEffect (dTreasury: -5, dPeople: -5, dArmy: -5))
  ];

  @override
  Widget build(BuildContext context) {
    if (!army.check() || !treasury.check() || !people.check() || !aristocracy.check()) {
      return MaterialApp (
        home: Scaffold (
            backgroundColor: Colors.lightGreen,
            appBar: AppBar (
              backgroundColor: Colors.green,
              title: Text ("Reigns: the Game"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Text ("Your reigns are over. You were overthrown",
                    style: TextStyle (
                        fontSize: 30,
                        letterSpacing: 1.2
                    ),
                  ),
                  Text ("You can calm your mind by thinking that people remembered you as a great king",
                    style: TextStyle (
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            )
        )
      );
    }

    GameCard currCard = cards [Random ().nextInt(cards.length)];

    return MaterialApp(
      home: Scaffold (
        backgroundColor: Color.fromRGBO(245, 215, 185, 12),
        appBar: AppBar (
          backgroundColor: Colors.lightGreen,
          title: Text ("Reigns: the Game"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                army.getWidget (),
                people.getWidget (),
                treasury.getWidget (),
                aristocracy.getWidget (),
              ]
            ),
            SizedBox (height: 30),
            Text ("This year's event:",
              style: TextStyle(
                letterSpacing: 1.1,
                fontSize: 20,
              ),
            ),
            SizedBox (height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row (
                children: <Widget>[
                  FloatingActionButton (
                    onPressed: (){
                      setState(() {
                        currCard.reject(army: army, treasury: treasury, people: people, aristocracy: aristocracy);
                        age ++;
                      });
                    },
                    backgroundColor: Colors.redAccent,
                    child: Text ("Nay"),
                  ),
                  SizedBox (width: 20),
                  currCard.display(),
                  SizedBox (width: 20),
                  FloatingActionButton (
                    onPressed: (){
                      setState(() {
                        currCard.approve(army: army, treasury: treasury, people: people, aristocracy: aristocracy);
                        age++;
                      });
                    },
                    child: Text ("Yarr"),
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ),
            Text (
              "Your age, o' wise king: $age",
              style: TextStyle (
                letterSpacing: 1.1,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
