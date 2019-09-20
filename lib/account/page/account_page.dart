import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/image_utils.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter_deer/widgets/click_item.dart';

import '../account_router.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Color> blueColorList1 = [
    Color(0xff60a3f0),
    Color(0xf1425df5),
    Color(0xfa425df5),
    Color(0xff425df5),
  ];
  List<Color> blueColorList2 = [
    Color(0xffeb8878),
    Color(0xf1f58d7d),
    Color(0xfaf5654e),
    Color(0xfffc3d1e),
  ];
  bool isSelectedFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: "资金管理",
        ),
        body: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.8,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                highlightColor: Colors.white,
                onTap: () {
                  setState(() {
                    isSelectedFirst = !isSelectedFirst;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: isSelectedFirst
                              ? blueColorList1
                              : blueColorList2),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: !isSelectedFirst
                                ? Color(0xfaf5654e)
                                : Color(0xff425df5),
                            blurRadius: 16,
                            spreadRadius: -8,
                            offset: Offset(0.0, 4.0)),
                        BoxShadow(
                            color: !isSelectedFirst
                                ? Color(0xfaf5654e)
                                : Color(0xff425df5),
                            blurRadius: 8,
                            spreadRadius: -8,
                            offset: Offset(-4, 8.0))
                      ]),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -25,
                        left: -25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                          ),

                          child: Container(
                            decoration: new BoxDecoration(
                              color: !isSelectedFirst
                                  ? Colors.white12
                                  : Color(0x10FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            height: 100,
                            width: 100,
                          ),
                          //                    clipper: ,
                        ),
                      ),
                      Positioned(
                        top: 44,
                        left: 44,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                          ),

                          child: Container(
                            decoration: new BoxDecoration(
                              color: !isSelectedFirst
                                  ? Colors.white12
                                  : Color(0x10FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            height: 36,
                            width: 36,
                          ),
                          //                    clipper: ,
                        ),
                      ),
                      Positioned(
                        bottom: -25,
                        right: -64,
                        child: Transform.rotate(
                          angle: pi / 10,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: 25,
                            decoration: new BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    !isSelectedFirst
                                        ? Colors.white12
                                        : Color(0x10FFFFFF),
                                    Colors.transparent,
                                    Colors.transparent
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -25,
                        right: 0,
                        child: Transform.rotate(
                          angle: pi / 10,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: 25,
                            decoration: new BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                  !isSelectedFirst
                                      ? Colors.white12
                                      : Color(0x10FFFFFF),
                                  Colors.transparent,
                                  Colors.transparent
                                ])),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Gaps.vGap5,
            AspectRatio(
              aspectRatio: 1.85,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(ImageUtils.getImgPath("account/bg")),
                            fit: BoxFit.fill)),
                  ),
                  Positioned.fill(
                    top: 37.0,
                    child: Column(
                      children: <Widget>[
                        const Text("当前余额(元)",
                            style: TextStyle(
                                color: Colours.login_text_disabled,
                                fontSize: 12.0)),
                        Gaps.vGap8,
                        Text("30.12",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 37.0,
                    left: 70.0,
                    right: 70.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            const Text("累计结算金额",
                                style: TextStyle(
                                    color: Colours.login_text_disabled,
                                    fontSize: 12.0)),
                            Gaps.vGap8,
                            Text("20000.00",
                                style: TextStyle(
                                    color: Colours.login_text_disabled,
                                    fontSize: 14.0)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            const Text("累计发放佣金",
                                style: TextStyle(
                                    color: Colours.login_text_disabled,
                                    fontSize: 12.0)),
                            Gaps.vGap8,
                            Text("0.02",
                                style: TextStyle(
                                    color: Colours.login_text_disabled,
                                    fontSize: 14.0)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gaps.vGap5,
            ClickItem(
              title: "提现",
              onTap: () {
                NavigatorUtils.push(context, AccountRouter.withdrawalPage);
              },
            ),
            ClickItem(
              title: "提现记录",
              onTap: () {
                NavigatorUtils.push(
                    context, AccountRouter.withdrawalRecordListPage);
              },
            ),
            ClickItem(
              title: "提现密码",
              onTap: () {
                NavigatorUtils.push(
                    context, AccountRouter.withdrawalPasswordPage);
              },
            ),
          ],
        ));
  }
}
