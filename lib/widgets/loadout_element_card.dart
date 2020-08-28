import 'package:flutter/cupertino.dart';
import 'package:r6_operators_info/settings/themes.dart';

enum LoadoutElementType {
  ability,
  gadget,
  primary,
  secondary
}

class LoadoutElementCard extends StatefulWidget {
  LoadoutElementCard({Key key, @required this.name, @required this.type}) : super(key: key);

  final String name;
  final LoadoutElementType type;

  @override
  _LoadoutElementCardState createState() => _LoadoutElementCardState();
}

class _LoadoutElementCardState extends State<LoadoutElementCard> {
  @override
  Widget build(BuildContext context) {
    final String _name = widget.name;
    final LoadoutElementType _type = widget.type;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
          children: [
            Builder(
                builder: (context) {
                  switch (_type) {
                    case LoadoutElementType.ability: {
                      return Image(
                        fit: BoxFit.contain,
                        image: AssetImage('res/Loadout/Ability/$_name.png'),
                      );
                    }
                    break;

                    case LoadoutElementType.gadget: {
                      return Image(
                        fit: BoxFit.contain,
                        image: AssetImage('res/Loadout/Gadget/$_name.png'),
                      );
                    }
                    break;

                    case LoadoutElementType.primary: {
                      return Image(
                        fit: BoxFit.contain,
                        image: AssetImage('res/Loadout/Primary/$_name.png'),
                      );
                    }
                    break;

                    case LoadoutElementType.secondary: {
                      return Image(
                        fit: BoxFit.contain,
                        image: AssetImage('res/Loadout/Secondary/$_name.png'),
                      );
                    }
                    break;

                    default: {
                      return Image(
                        fit: BoxFit.contain,
                        image: AssetImage('res/Loadout/Secondary/$_name.png'),
                      );
                    }
                    break;
                  }
                }
            ),
            Text(
              _name.toUpperCase(),
              style: appTheme.textTheme.headline1,
            )
          ]
      )
    );
  }
}