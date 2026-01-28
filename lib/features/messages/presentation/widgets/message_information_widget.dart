import 'package:flutter/material.dart';

class MessageInformationWidget extends StatelessWidget {
  final String senderName;
  final String shift;
  final String date;
  const MessageInformationWidget({
    super.key,
    required this.senderName,
    required this.shift,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        _CustomRichText(keyParam: 'Enviado por:  ', valueParam: senderName),
        const SizedBox(height: 8),
        _CustomRichText(keyParam: 'Jornada:  ', valueParam: shift),
        const SizedBox(height: 8),
        _CustomRichText(keyParam: 'Fecha:  ', valueParam: date),
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
