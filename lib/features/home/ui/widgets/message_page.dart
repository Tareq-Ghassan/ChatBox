import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:chat/features/home/ui/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [MessagePage] represent message Page
class MessagePage extends StatelessWidget {
  /// [MessagePage] constructor
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => BlocProvider(
        create: (_) => SwipeOffsetCubit(),
        child: const ChatItem(),
      ),
      itemCount: 100,
    );
  }
}
