import 'package:whatsapp_monitor_viewer/features/messages/data/models/raw_message_model.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';

Message toDomain(RawMessageModel model) {
  return Message(
    id: model.id,
    chatJid: model.chatJid,
    senderName: model.senderName,
    hasMedia: model.hasMedia,
    messageTimestamp: model.messageTimestamp,
    localTime: model.localTime,
    caption: model.caption,
    storagePath: model.storagePath,
  );
}
