import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:flutter/material.dart';

class MissionCommonView extends StatelessWidget {
  const MissionCommonView({
    super.key,
    required this.title,
    required this.mission,
    required this.appBarTitle,
    required this.value,
    this.leftButton,
    this.rightButton,
    this.module = Module.A,
    this.appBarWidget,
    this.order,
    this.missionWidgetColor,
  });

  final Color? missionWidgetColor;
  final String title;
  final String appBarTitle;
  final double? value;
  final Widget mission;
  final Widget? leftButton;
  final Widget? rightButton;
  final Module module;
  final Widget? appBarWidget;
  final int? order;

  // late AudioPlayer _audioPlayer;
  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      isRequiredPortrait: false,
      customContent: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffe7e7e7),
            toolbarHeight: 60,
            title: module == Module.A
                ? Center(
                    child: Column(
                      children: [
                        Text(
                          appBarTitle,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: 300,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: LinearProgressIndicator(
                                value: value,
                                minHeight: 6,
                                backgroundColor: const Color(0xffB7B7B7),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  missionWidgetColor ??
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : appBarWidget,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          module == Module.A
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.4,
                                    ),
                                    color:
                                        missionWidgetColor ??
                                        Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  height: 52,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: module == Module.B
                                ? MediaQuery.of(context).size.height - 112
                                : MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.4,
                              ),
                              color: Colors.white,
                              borderRadius: module == Module.A
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    )
                                  : const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                            ),
                            child: Center(child: mission),
                          ),
                        ],
                      ),
                      module == Module.B
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                bottom: 10.0,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    leftButton ?? Container(),
                                    rightButton ?? Container(),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              order == null || order == 0
                  ? Container()
                  : Positioned(
                      right: 15,
                      top: 10,
                      child: Text(
                        '$order/4',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
