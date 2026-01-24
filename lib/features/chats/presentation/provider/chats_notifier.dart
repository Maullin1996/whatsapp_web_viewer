import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/chats/data/datasources/chats_firestore_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/chats/data/repositories/chats_repository_impl.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';

class ChatsNotifier extends AsyncNotifier<List<Chat>> {
  late final ChatsRepositoryImpl _repository;

  @override
  Future<List<Chat>> build() async {
    _repository = ChatsRepositoryImpl(ChatsFirestoreDatasource());
    return _loadChats();
  }

  Future<List<Chat>> _loadChats() async {
    final Either<Failure, List<Chat>> result = await _repository.getChats();

    return result.fold((failure) => throw failure, (chats) => chats);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadChats);
  }
}
