// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';


import 'package:instant_messaging/src/provider/theme.dart';
import 'package:instant_messaging/utils/toast.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DefaultThemeData>(context).theme;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          shadowColor: theme.weakDividerColor,
          elevation: 1,
          title: Text(
            TIM_t("联系我们"),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                theme.lightPrimaryColor ?? CommonColor.lightPrimaryColor,
                theme.primaryColor ?? CommonColor.primaryColor
              ]),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: hexToColor("ecf3fe"),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // 因为底部有波浪图， icon向上一点，感觉视觉上更协调
                margin: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Text(
                      TIM_t("反馈及建议可以与我们联系"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.darkTextColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "15110055954",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor),
                      ),
                    ),
                    Text(
                      TIM_t("在线时间: 周一到周五，早上10点 - 晚上8点"),
                      style: TextStyle(
                        color: theme.darkTextColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(const ClipboardData(text: '788910197'));
                          ToastUtils.toast(TIM_t("电话复制成功"));
                        },
                        child: Text(TIM_t("复制电话")),
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/logo_bottom.png",
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
        ),
    );
  }
}
