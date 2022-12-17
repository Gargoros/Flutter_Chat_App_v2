import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/providers/message_replied_provider.dart';
import 'package:flutter_chat_app/features/chat/widgets/display_text_image_gif.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageReplayPreview extends ConsumerWidget {
  const MessageReplayPreview({super.key});

  void cancelReplay(WidgetRef ref) {
    ref.read(messageReplayProvider.notifier).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReplay = ref.watch(messageReplayProvider);
    return Container(
      width: 350,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  messageReplay!.isMe ? "Me" : "Opposite",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
                onTap: () => cancelReplay(ref),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          DisplayTextImageGif(
              message: messageReplay.message, type: messageReplay.messageEnum),
        ],
      ),
    );
  }
}
