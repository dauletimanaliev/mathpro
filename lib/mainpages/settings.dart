import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/custom_widgets/custom_toggle_switch.dart';
import 'package:offermath/mainpages/settings_details_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.sp),
          child: BackButton(
            style: ButtonStyle(iconSize: WidgetStatePropertyAll(35)),
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Column(
    children: [
      Center(
        child: Text(
          'Customization ',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(
        height: 25.h,
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: ListView(
            children: [
              CustomCard(
                typeSettings: 'Notifications',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsDetailPage(
                        title: 'Notifications',
                        body: ListTile(
                          title: Text(
                            'ON/OFF',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: CustomToggleSwitch(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              CustomCard(
                typeSettings: 'Customization & Preferences  ',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsDetailPage(
                          title: 'Customization & Preferences  '),
                    ),
                  );
                },
              ),
              CustomCard(
                typeSettings: 'Security & Privacy',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          SettingsDetailPage(title: 'Security & Privacy'),
                    ),
                  );
                },
              ),
              CustomCard(
                typeSettings: 'Support & Actions',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          SettingsDetailPage(title: 'Support & Actions'),
                    ),
                  );
                },
              ),
              CustomCard(
                typeSettings: 'About',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsDetailPage(title: 'About'),
                    ),
                  );
                },
              ),
              CustomCard(
                typeSettings: 'Subscription',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsDetailPage(title: 'Subscription'),
                    ),
                  );
                },
              ),
              CustomCard(
                typeSettings: 'Payment',
                moreInfo: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsDetailPage(title: 'Payment'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      )
    ],
  );
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.typeSettings,
    this.moreInfo,
  });

  final String typeSettings;
  final VoidCallback? moreInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: moreInfo,
        contentPadding: EdgeInsets.all(15.sp),
        title: Text(
          typeSettings,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
