import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/chat/ui/bloc/chats_bloc.dart';
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
    return BlocConsumer<ChatsBloc, ChatsState>(
      bloc: sl<ChatsBloc>(),
      listener: (context, state) {},
      builder: (context, state) => SliverList.builder(
        itemBuilder: (context, index) => BlocProvider(
          create: (_) => sl<SwipeOffsetCubit>(),
          child: state is ChatsLoaded
              ? ChatItem(selectedChat: state.chats.chats[index])
              : null,
        ),
        itemCount: state is ChatsLoaded ? state.chats.chats.length : null,
      ),
    );
  }
}
