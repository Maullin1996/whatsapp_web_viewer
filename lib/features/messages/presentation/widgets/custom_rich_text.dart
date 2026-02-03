import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String keyParam;
  final String valueParam;

  const CustomRichText({
    super.key,
    required this.keyParam,
    required this.valueParam,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: keyParam,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(text: valueParam, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
