import 'package:flutter/cupertino.dart';
import 'package:flutx/themes/app_theme.dart';


class Category {
  final String image, title;
  final Color color;

  Category(this.image, this.title, this.color);



  static List<Category> getList(){
    
    return [
      Category("./assets/images/customapps/grocery/strawberry.png", "Fruit", FxAppTheme.customTheme.red.withAlpha(50)),
      Category("./assets/images/customapps/grocery/bread.png", "Bread", FxAppTheme.customTheme.orange.withAlpha(60)),
      Category("./assets/images/customapps/grocery/broccoli.png", "Veggie", FxAppTheme.customTheme.green.withAlpha(50)),
      Category("./assets/images/customapps/grocery/cheese.png", "Dairy", FxAppTheme.customTheme.yellow.withAlpha(70)),
    ];
  }
}
