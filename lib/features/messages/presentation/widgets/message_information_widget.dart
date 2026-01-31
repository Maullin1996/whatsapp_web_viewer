import 'package:flutter/material.dart';

import 'package:whatsapp_monitor_viewer/core/time/shifts.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/custom_rich_text.dart';
import '../../domain/entities/message.dart';

class MessageInformationWidget extends StatelessWidget {
  final Message message;

  const MessageInformationWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final messageDate = DateTime.fromMillisecondsSinceEpoch(
      message.messageTimestamp,
    ).toLocal();

    final shift = getCurrentShift(messageDate);
    final shiftLabel = shiftNames[shift]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        CustomRichText(
          keyParam: 'Enviado por:  ',
          valueParam: message.senderName,
        ),
        const SizedBox(height: 8),
        CustomRichText(keyParam: 'Jornada:  ', valueParam: shiftLabel),
        const SizedBox(height: 8),
        CustomRichText(keyParam: 'Fecha:  ', valueParam: message.localTime),
      ],
    );
  }
}
