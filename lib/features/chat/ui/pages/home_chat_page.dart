import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/chat/ui/widget/chat_item.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [HomeChatPage] represent message Page
class HomeChatPage extends StatelessWidget {
  /// [HomeChatPage] constructor
  const HomeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => BlocProvider(
        create: (_) => sl<SwipeOffsetCubit>(),
        child: const ChatItem(),
      ),
      itemCount: 100,
    );
  }
}
