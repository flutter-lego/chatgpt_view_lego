import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:june_flow_util/june_flow_util.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:styled_widget/styled_widget.dart';

import 'appbar.dart';
import 'chat_card.dart';
import 'drawer.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  bool enableSendButton = false;
  final TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FooterLayout(
      footer: Container(
        height: 100,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(10),
                Expanded(
                  // Flexible 또는 Expanded 사용
                  child: TextFormField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    // 최소 시작 줄 수
                    maxLines: 4,
                    // 최대 확장될 수 있는 줄 수
                    decoration: InputDecoration(
                      hintMaxLines: 1,
                      hintText: 'Message',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      // Padding 조절
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: enableSendButton
                        ? Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withOpacity(0.8)
                        : Colors.grey.withOpacity(0.5),
                  ),
                  child: SvgPicture.asset(
                    'assets/lego/chatgpt_view_lego/arrow-up.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ).padding(all: 7),
                ),
              ],
            ).padding(horizontal: 10, vertical: 10),
          ],
        ),
      ),
      child: Scaffold(
        // backgroundColor: const Color(0xff202123),
        appBar: AppbarView(),
        drawer: DrawerView(),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ChatCardView(
            id: '1',
            message: 'Hello, how can I help you?',
            userId: 'chatGPT',
            userName: 'ChatGPT',
            imageUrl: 'assets/chatgpt_logo.webp',
            createdAt: 1628180000,
          ),
          ChatCardView(
            id: '2',
            message: 'I need help with my computer',
            userId: 'user',
            userName: 'User',
            imageUrl: 'assets/user.webp',
            createdAt: 1628180000,
          ),
          ChatCardView(
            id: '3',
            message: 'Sure, what seems to be the problem?',
            userId: 'chatGPT',
            userName: 'ChatGPT',
            imageUrl: 'assets/chatgpt_logo.webp',
            createdAt: 1628180000,
          ),
        ]),
        floatingActionButton: FloatingActionButtonKit(),
      ),
    );
  }
}

main() async {
  return runApp(MaterialApp(
    home: NewView(),
  ));
}
