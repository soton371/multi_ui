import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/medicare/models/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';

import 'models/slot.dart';

class MediCareAppointmentScreen extends StatefulWidget {
  @override
  _MediCareAppointmentScreenState createState() =>
      _MediCareAppointmentScreenState();
}

class _MediCareAppointmentScreenState extends State<MediCareAppointmentScreen> {
  late int selectedDate = 0;
  late int selectedSlot = 0;

  late List<DateTime> data;
  late List<String> morningSlots;
  late List<String> afternoonSlots;
  late List<String> eveningSlots;

  @override
  initState() {
    super.initState();

    data = DateTime.dummyList();
    morningSlots = Slot.morningList();
    afternoonSlots = Slot.afternoonList();
    eveningSlots = Slot.eveningList();
  }

  List<Widget> _buildDateList() {
    List<Widget> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(
          _buildSingleDate(date: data[i].date, day: data[i].day, index: i));
    }
    return list;
  }

  List<Widget> _buildMorningSlotList(){
    List<Widget> list = [];
    for (int i = 0; i < morningSlots.length; i++) {
      list.add(_buildSingleSlot(time:morningSlots[i],index: i ));
    }
    return list;
  }

  List<Widget> _buildAfternoonSlotList(){
    List<Widget> list = [];
    for (int i = 0; i < afternoonSlots.length; i++) {
      list.add(_buildSingleSlot(time:afternoonSlots[i],index: i+morningSlots.length ));
    }
    return list;
  }

  List<Widget> _buildEveningSlotList(){
    List<Widget> list = [];
    for (int i = 0; i < eveningSlots.length; i++) {
      list.add(_buildSingleSlot(time:eveningSlots[i],index: i+morningSlots.length+afternoonSlots.length));
    }
    return list;
  }

  Widget _buildSingleSlot({String? time, int? index}){
    return InkWell(
        onTap: () {
      setState(() {
        selectedSlot = index!;
      });
    },
      child:  FxContainer(
        color: selectedSlot == index
            ? AppTheme.customTheme.medicarePrimary
            : FxAppTheme.customTheme.bgLayer2,
          child: Text(
           time!,
            style: FxTextStyle.caption(fontWeight: 700,
                color: selectedSlot == index
                    ? AppTheme.customTheme.medicareOnPrimary
                    : FxAppTheme.theme.colorScheme.onBackground),
          ),
          padding:
          FxSpacing.symmetric(vertical: 8, horizontal: 16),
          borderRadiusAll: 4,
        )
    );
  }

  Widget _buildSingleDate({String? date, String? day, int? index}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index!;
        });
      },
      child: FxContainer(
        paddingAll: 12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day!,
              style: FxTextStyle.caption(
                  fontWeight: 800,
                  color: selectedDate == index
                      ? AppTheme.customTheme.medicareOnPrimary
                      : FxAppTheme.theme.colorScheme.onBackground),
            ),
            FxSpacing.height(12),
            Text(
              date!,
              style: FxTextStyle.caption(
                  fontWeight: 700,
                  color: selectedDate == index
                      ? AppTheme.customTheme.medicareOnPrimary
                      : FxAppTheme.theme.colorScheme.onBackground),
            ),
          ],
        ),
        color: selectedDate == index
            ? AppTheme.customTheme.medicarePrimary
            : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.medicarePrimary.withAlpha(80))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              )),
          elevation: 0,
          title: Text(
            'Appointment',
            style: FxTextStyle.b1(fontWeight: 700),
          ),
        ),
        body: Container(
          color: FxAppTheme.customTheme.bgLayer1,
          child: Column(
            children: [
              Container(
                padding: FxSpacing.nRight(16),
                color: FxAppTheme.customTheme.bgLayer2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _buildDateList(),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: FxSpacing.all(24),
                  children: [
                    Text(
                      'Morning Slots',
                      style: FxTextStyle.b2(fontWeight: 800),
                    ),
                    FxSpacing.height(8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: _buildMorningSlotList(),
                    ),
                    FxSpacing.height(32),
                    Text(
                      'Afternoon Slots',
                      style: FxTextStyle.b2(fontWeight: 800),
                    ),
                    FxSpacing.height(8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: _buildAfternoonSlotList(),
                    ),
                    FxSpacing.height(32),
                    Text(
                      'Evening Slots',
                      style: FxTextStyle.b2(fontWeight: 800),
                    ),
                    FxSpacing.height(8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: _buildEveningSlotList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: FxSpacing.all(24),
                child: FxButton.block(
                  borderRadiusAll: 8,
                  onPressed: () {

                  },
                  backgroundColor: AppTheme.customTheme.medicarePrimary,
                  child: Text(
                    "Confirm Appointment",
                    style: FxTextStyle.b2(
                      fontWeight: 700,
                      color: AppTheme.customTheme.medicareOnPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
