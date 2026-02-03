import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/core/loading/app_shimmer.dart';

class ChatsListLoading extends StatelessWidget {
  final int itemCount;
  const ChatsListLoading({super.key, this.itemCount = 12});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (_, _) => const _ChatSkeletonTile(),
      ),
    );
  }
}

class _ChatSkeletonTile extends StatelessWidget {
  const _ChatSkeletonTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 48,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 120,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
