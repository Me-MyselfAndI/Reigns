
import 'package:flutter/material.dart';
import 'package:reigns/indicator.dart';

class GameCard {
  String image;
  Widget text;
  IndicatorsEffect approvalEffect, rejectionEffect;

  GameCard (String eventText, this.image, this.approvalEffect, this.rejectionEffect) {
    this.text = Container(
      child: Text(eventText,
        maxLines: 99,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontSize: 15
        ),
        textAlign: TextAlign.center,
      ),
      width: 240,
    );

  }

  void approve ({Indicator army, Indicator treasury, Indicator people, Indicator aristocracy}) {
    army.level += approvalEffect.dArmy;
    treasury.level += approvalEffect.dTreasury;
    people.level += approvalEffect.dPeople;
    aristocracy.level += approvalEffect.dAristocracy;
  }

  void reject ({Indicator army, Indicator treasury, Indicator people, Indicator aristocracy}) {
    army.level += rejectionEffect.dArmy;
    treasury.level += rejectionEffect.dTreasury;
    people.level += rejectionEffect.dPeople;
    aristocracy.level += rejectionEffect.dAristocracy;
  }

  void updateIndicators (){
  }

  Widget display () {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        text,
        SizedBox (height: 30),
        Container (
          child: Image.asset(image,
            scale: 1.5,
          ),
        ),
      ],
    );
  }
}

class IndicatorsEffect {

  int dArmy, dTreasury, dPeople, dAristocracy;

  IndicatorsEffect ({this.dArmy = 0, this.dTreasury = 0, this.dPeople = 0, this.dAristocracy = 0});

  Map changeIndicators () {
    return {
      'army' : dArmy,
      'treasury' : dTreasury,
      'people' : dPeople,
      'aristocracy' : dAristocracy
    };
  }
}