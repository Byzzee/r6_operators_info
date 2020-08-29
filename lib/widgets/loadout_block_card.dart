import 'package:flutter/cupertino.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'information_card.dart';
import 'loadout_element_card.dart';


class LoadoutBlockCard extends StatefulWidget {
  LoadoutBlockCard({Key key, @required this.type, @required this.elements}) : super(key: key);

  final LoadoutElementType type;
  final List<String> elements;

  @override
  _LoadoutBlockCardState createState() => _LoadoutBlockCardState();
}

class _LoadoutBlockCardState extends State<LoadoutBlockCard> {
  @override
  Widget build(BuildContext context) {
    final LoadoutElementType _type = widget.type;
    final List<String> _elements = widget.elements;
    final List<Widget> _elementCards = [];

    _elements.forEach((element) => _elementCards.add(LoadoutElementCard(
      name: element,
      type: _type
    )));

    return InformationCard(
        child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0, bottom: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                      opacity: 0.3,
                      child: Builder(
                        builder: (context) {
                          switch (_type) {
                            case LoadoutElementType.ability: {
                              return Text('UNIQUE ABILITY', style: appTheme.textTheme.headline4);
                            }
                            break;

                            case LoadoutElementType.gadget: {
                              return Text('GADGET', style: appTheme.textTheme.headline4);
                            }
                            break;

                            case LoadoutElementType.primary: {
                              return Text('PRIMARY WEAPON', style: appTheme.textTheme.headline4);
                            }
                            break;

                            case LoadoutElementType.secondary: {
                              return Text('SECONDARY WEAPON', style: appTheme.textTheme.headline4);
                            }
                            break;

                            default: {
                              return Text('SECONDARY WEAPON', style: appTheme.textTheme.headline4);
                            }
                            break;
                          }
                        }
                      )
                  ),
                  Builder(
                    builder: (context) {
                      if (_type == LoadoutElementType.ability) {
                        return Center(
                          child: _elementCards[0]
                        );
                      }
                      else {
                        return GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                            shrinkWrap: true,
                            primary: false,
                            children: _elementCards
                        );
                      }
                    }
                  )
                ]
            )
        )
    );
  }
}