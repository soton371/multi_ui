import 'package:flutx/icons/two_tone/two_tone_icon_data.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';

class Category{


  final FxTwoToneIconData icon;
  final String title;

  Category(this.icon, this.title);


  static List<Category> getList(){
    return [
      Category(FxTwoToneMdiIcons.kitchen, "All"),
      Category(FxTwoToneMdiIcons.fastfood, "Fastfood"),
      Category(FxTwoToneMdiIcons.local_pizza, "Pizza"),
      Category(FxTwoToneMdiIcons.cake, "Cake"),
      Category(FxTwoToneMdiIcons.set_meal, "Sea Food"),
      Category(FxTwoToneMdiIcons.local_cafe, "Tea"),

    ];
  }


}