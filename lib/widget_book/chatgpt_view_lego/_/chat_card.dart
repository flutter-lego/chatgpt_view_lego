import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatCardView extends StatefulWidget {
  ChatCardView({
    super.key,
    required this.id,
    required this.message,
    required this.userId,
    required this.userName,
    required this.imageUrl,
    required this.createdAt,
  });

  final String id;
  final String message;
  final String userId;
  final String userName;
  final String imageUrl;
  final int createdAt;

  @override
  State<ChatCardView> createState() => _ChatCardViewState();
}

class _ChatCardViewState extends State<ChatCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 110,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: widget.userId == 'chatGPT'
                    ? const DecorationImage(
                        image: AssetImage(
                            "assets/lego/chatgpt_view_lego/chatgpt_logo.webp"),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: Colors.grey,
              ),
              child: widget.userId != 'chatGPT'
                  ? Center(
                      child: Text(
                        "S",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    )
                  : null),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ).padding(top: 5).expanded(),
        ],
      ).padding(horizontal: 20, vertical: 30),
    );
  }
}

main() async {
  return runApp(MaterialApp(
    home: ChatCardView(
      id: 'id',
      message: 'message',
      userId: 'userId',
      userName: 'userName',
      imageUrl: 'imageUrl',
      createdAt: 0,
    ).center(),
  ));
}
