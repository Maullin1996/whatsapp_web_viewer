import 'package:flutter/material.dart';

import 'package:whatsapp_monitor_viewer/core/time/shifts.dart';
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
        _CustomRichText(
          keyParam: 'Enviado por:  ',
          valueParam: message.senderName,
        ),
        const SizedBox(height: 8),
        _CustomRichText(keyParam: 'Jornada:  ', valueParam: shiftLabel),
        const SizedBox(height: 8),
        _CustomRichText(keyParam: 'Fecha:  ', valueParam: message.localTime),
      ],
    );
  }
}

class _CustomRichText extends StatelessWidget {
  final String keyParam;
  final String valueParam;
  const _CustomRichText({required this.keyParam, required this.valueParam});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: keyParam,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(text: valueParam, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
