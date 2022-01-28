import 'package:UIKit/customapps/medicare/medicare_single_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/generators/star_rating.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../AppTheme.dart';
import 'models/category.dart';
import 'models/doctor.dart';

class MediCareHomeScreen extends StatefulWidget {
  @override
  _MediCareHomeScreenState createState() => _MediCareHomeScreenState();
}

class _MediCareHomeScreenState extends State<MediCareHomeScreen> {
  int selectedCategory = 0;
  List<Category> categoryList = [];
  List<Doctor> doctorList = [];

  Widget _buildSingleCategory(
      {int? index, String? categoryName, IconData? categoryIcon}) {
    return Padding(
      padding: FxSpacing.right(16),
      child: FxCard(
        paddingAll: 8,
        borderRadiusAll: 8,
        bordered: true,
        splashColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
        border: Border.all(
            color: selectedCategory == index
                ? Colors.transparent
                : FxAppTheme.customTheme.border2,
            width: 1),
        color: selectedCategory == index
            ? FxAppTheme.customTheme.bgLayer2
            : Colors.transparent,
        onTap: () {
          setState(() {
            selectedCategory = index!;
          });
        },
        child: Row(
          children: [
            FxContainer.rounded(
              child: Icon(
                categoryIcon,
                color: AppTheme.customTheme.medicarePrimary,
                size: 16,
              ),
              color: FxAppTheme.theme.colorScheme.onBackground.withAlpha(16),
              paddingAll: 4,
            ),
            FxSpacing.width(8),
            FxText.caption(
              categoryName!,
              fontWeight: 600,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = Category.categoryList();
    doctorList = Doctor.doctorList();
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(24));

    for (int i = 0; i < categoryList.length; i++) {
      list.add(_buildSingleCategory(
          index: i,
          categoryName: categoryList[i].category,
          categoryIcon: categoryList[i].categoryIcon));
    }
    return list;
  }

  List<Widget> _buildDoctorList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (int i = 0; i < doctorList.length; i++) {
      list.add(_buildSingleDoctor(doctorList[i]));
    }
    return list;
  }

  Widget _buildSingleDoctor(Doctor doctor) {
    return FxCard(

      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MediCareSingleDoctorScreen(doctor)));
      },
      margin: FxSpacing.fromLTRB(24, 0, 24, 16),
      paddingAll: 16,
      borderRadiusAll: 16,
      child: Row(
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image(
                width: 72,
                height: 72,
                image: AssetImage(doctor.image),
              ),
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b1(
                  doctor.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.caption(
                  doctor.category,
                  xMuted: true,

                ),
                FxSpacing.height(12),
                Row(
                  children: [
                    FxStarRating.buildRatingStar(
                        rating: doctor.ratings, showInactive: true, size: 15),
                    FxSpacing.width(4),
                    FxText.caption(
                      doctor.ratings.toString() +
                          ' | ' +
                          doctor.reviews.toString() +
                          ' Reviews',
                      xMuted: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.top(48),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxSpacing.width(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.overline(
                      'Current Location',
                      color: FxAppTheme.theme.colorScheme.onBackground,
                      xMuted: true,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppTheme.customTheme.medicarePrimary,
                          size: 12,
                        ),
                        FxSpacing.width(4),
                        FxText.caption(
                          'Semarang, INA',
                          color: FxAppTheme.theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                      ],
                    ),
                  ],
                ),
                FxContainer(
                  paddingAll: 4,
                  borderRadiusAll: 4,
                  color: FxAppTheme.customTheme.bgLayer2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Icon(
                        FeatherIcons.bell,
                        size: 20,
                        color: FxAppTheme.theme.colorScheme.onBackground
                            .withAlpha(200),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: FxContainer.rounded(
                          paddingAll: 4,
                          child: Container(),
                          color: AppTheme.customTheme.medicarePrimary,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: FxTextField(
              focusedBorderColor: AppTheme.customTheme.medicarePrimary,
              cursorColor: AppTheme.customTheme.medicarePrimary,
              textFieldStyle: FxTextFieldStyle.outlined,
              labelText: 'Search a doctor or health issue',
              labelStyle: FxTextStyle.caption(
                  color: FxAppTheme.theme.colorScheme.onBackground,
                  xMuted: true),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: FxAppTheme.customTheme.bgLayer2,
              prefixIcon: Icon(
                FeatherIcons.search,
                color: AppTheme.customTheme.medicarePrimary,
                size: 20,
              ),
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.b2(
                  'Upcoming Schedule',
                  fontWeight: 700,
                ),
                FxText.overline('See all',
                    color: AppTheme.customTheme.medicarePrimary),
              ],
            ),
          ),
          FxSpacing.height(24),
          FxContainer(
            borderRadiusAll: 16,
            margin: FxSpacing.horizontal(24),
            child: Column(
              children: [
                Row(
                  children: [
                    FxContainer(
                      paddingAll: 0,
                      borderRadiusAll: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image(
                          height: 40,
                          width: 40,
                          image: AssetImage(
                            'assets/images/avatar-3.jpg',
                          ),
                        ),
                      ),
                    ),
                    FxSpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.caption(
                            'Dr.Haley lawrence',
                            color: AppTheme.customTheme.medicareOnPrimary,
                            fontWeight: 700,
                          ),
                          FxText.overline(
                            'Dermatologists',
                            color: AppTheme.customTheme.medicareOnPrimary
                                .withAlpha(200),
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.width(16),
                    FxContainer.rounded(
                      paddingAll: 4,
                      child: Icon(
                        Icons.videocam_outlined,
                        color: AppTheme.customTheme.medicarePrimary,
                        size: 16,
                      ),
                      color: AppTheme.customTheme.medicareOnPrimary,
                    ),
                  ],
                ),
                FxSpacing.height(16),
                FxContainer(
                  borderRadiusAll: 8,
                  color:
                      FxAppTheme.theme.colorScheme.onBackground.withAlpha(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: AppTheme.customTheme.medicareOnPrimary
                            .withAlpha(160),
                        size: 20,
                      ),
                      FxSpacing.width(8),
                      FxText.caption(
                        'Sun, Jan 19, 08:00am - 10:00am',
                        color: AppTheme.customTheme.medicareOnPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: AppTheme.customTheme.medicarePrimary,
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.b2(
                  'Let\'s find your doctor',
                  fontWeight: 700,
                ),
                Icon(
                  Icons.tune_outlined,
                  color: AppTheme.customTheme.medicarePrimary,
                  size: 20,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          FxSpacing.height(16),
          Column(
            children: _buildDoctorList(),
          ),
        ],
      ),
    );
  }
}
