/*
* File : Create File Bottom Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FileManagerBottomSheetWidget extends StatefulWidget {
  @override
  _FileManagerBottomSheetWidgetState createState() =>
      _FileManagerBottomSheetWidgetState();
}

class _FileManagerBottomSheetWidgetState
    extends State<FileManagerBottomSheetWidget> {
  late ThemeData themeData;

  List<int> _list = List.generate(20, (i) => i);

  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("File Manager",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  elevation: 2,
                  backgroundColor: themeData.colorScheme.primary,
                  label: Text(
                    "CREATE",
                    style: TextStyle(
                        color: themeData.colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3),
                  ),
                  icon: Icon(
                    MdiIcons.plus,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return Ink(
                          color: themeData.backgroundColor,
                          child: ListTile(
                            leading: Icon(
                              MdiIcons.folder,
                              color: themeData.colorScheme.onBackground,
                            ),
                            title: Text('Folder - ' + _list[index].toString(),
                                style: themeData.textTheme.bodyText1!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground))),
                          ));
                    },
                  ),
                )));
      },
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: MySize.size12!, bottom: MySize.size8!),
                        child: Text(
                          "CREATE",
                          style: themeData.textTheme.caption!.merge(TextStyle(
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w700)),
                        )),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.fileOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "File",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.folderOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Folder",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.folderAccountOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Sharable Folder",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Divider(
                      color: themeData.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.cloudUploadOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Upload photo",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.cameraOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Take Photo",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
