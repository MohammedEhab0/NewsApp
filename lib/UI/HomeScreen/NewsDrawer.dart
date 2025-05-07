import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/SettingProvider.dart';

class NewsDrawer extends StatefulWidget {
  NewsDrawer({required this.goHome});

  Function goHome;

  @override
  State<NewsDrawer> createState() => _NewsDrawerState();
}

class _NewsDrawerState extends State<NewsDrawer> {
  final List<String> languageItems = ['english'.tr(), 'arabic'.tr()];

  final List<String> themeItems = [
    'light'.tr(),
    'dark'.tr(),
  ];

  String? selectedlanguageValue;

  String? selectedthemeValue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var settingProviders = Provider.of<SettingProviders>(context);
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: height * .25,
            color: Theme.of(context).primaryColor,
            child: Center(
                child: Text(
              'news App',
              style: Theme.of(context).textTheme.headlineLarge,
            )),
          ),
          SizedBox(
            height: height * .02,
          ),
          TextButton(
            onPressed: () {
              widget.goHome();
            },
            child: Row(
              children: [
                SizedBox(width: width * .04),
                Icon(Icons.home_filled,
                    size: 30, color: Theme.of(context).primaryColor),
                SizedBox(width: 4),
                Expanded(
                  child: Text('go to home'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: height * .003,
            endIndent: width * .04,
            indent: width * .04,
          ),
          SizedBox(
            height: height * .02,
          ),
          Row(
            children: [
              SizedBox(width: width * .04),
              Icon(Icons.language,
                  size: 30, color: Theme.of(context).primaryColor),
              SizedBox(width: width * .04),
              Expanded(
                child: Text(
                  'language'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: height * .01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    SizedBox(width: width * .11),
                    Expanded(
                      child: Text(
                        'language'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: languageItems
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedlanguageValue,
                onChanged: (value) {
                  setState(() {
                    selectedlanguageValue = value;

                    if (selectedlanguageValue == 'arabic'.tr()) {
                      settingProviders.changeLanguage(context, 'ar');
                    } else {
                      settingProviders.changeLanguage(context, 'en');
                    }
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: height * .06,
                  width: width * .95,
                  padding:
                      EdgeInsets.only(left: width * .02, right: width * .03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  elevation: 2,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: height * .25,
                  width: width * .8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Theme.of(context).cardColor,
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: height * .1,
                ),
              ),
            ),
          ),
          SizedBox(height: height * .02),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: height * .003,
            endIndent: width * .03,
            indent: width * .03,
          ),
          SizedBox(
            height: height * .02,
          ),
          Row(
            children: [
              SizedBox(width: width * .04),
              Icon(Icons.sunny,
                  size: 30, color: Theme.of(context).primaryColor),
              SizedBox(width: width * .04),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'theme'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * .01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    SizedBox(width: width * .09),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'theme'.tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                items: themeItems
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedthemeValue,
                onChanged: (value) {
                  setState(() {
                    selectedthemeValue = value;
                    if (selectedthemeValue == 'dark'.tr()) {
                      settingProviders.changeTheme(ThemeMode.dark);
                    } else {
                      settingProviders.changeTheme(ThemeMode.light);
                    }
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: height * .06,
                  width: width * .95,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  elevation: 2,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: height * .25,
                  width: width * .8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Theme.of(context).cardColor,
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: height * .1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
