import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/Lang.dart';

final String aboutmeUrl = 'https://zhuanlan.zhihu.com/p/593575133?';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          "settingsTitle".tr,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(children: [buildLocale(context), buildAboutItem()]),
    );
  }

  Widget buildAboutItem() {
    return ListTile(
      onTap: _launchUrl,
      title: Text(
        'aboutme'.tr,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'aboutmeSub'.tr,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget buildAd() {
    return ListTile(
      // onTap: _launchUrl,
      title: Text(
        'dontTouch'.tr,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'dontTouchSub'.tr,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget buildLocale(BuildContext context) {
    return ListTile(
      onTap: () => _selectLang(context),
      title: Text(
        'applyLang'.tr,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'applyLangSub'.tr,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      trailing: Container(
        width: 24,
        height: 24,
        child: Icon(Icons.language, color: Colors.white),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(aboutmeUrl))) {
      throw 'Could not launch $aboutmeUrl';
    }
  }

  void _selectLang(BuildContext context) {
    showLanguageSelectDialog(context);
  }

  // void _selectColor(BuildContext context) async {
  //   Color initColor = Theme.of(context).primaryColor;
  //   final Color newColor = await showColorPickerDialog(
  //     context,
  //     initColor,
  //     title: Text('选择颜色', style: Theme.of(context).textTheme.titleLarge),
  //     width: 40,
  //     height: 40,
  //     spacing: 0,
  //     runSpacing: 0,
  //     borderRadius: 0,
  //     wheelDiameter: 165,
  //     enableOpacity: true,

  //     // showColorCode: true,
  //     // colorCodeHasColor: true,
  //     pickersEnabled: <ColorPickerType, bool>{ColorPickerType.accent: false},
  //     actionButtons: const ColorPickerActionButtons(
  //       okButton: true,
  //       closeButton: true,
  //       dialogActionButtons: false,
  //     ),
  //     constraints:
  //         const BoxConstraints(minHeight: 300, minWidth: 320, maxWidth: 320),
  //   );

  //   Get.changeTheme(ThemeData(primaryColor: newColor));
  // }
}
