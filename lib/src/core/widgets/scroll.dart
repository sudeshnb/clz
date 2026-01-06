import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class ScrollDetectCubit extends Cubit<ScrollDetectState> {
  ScrollDetectCubit() : super(const ScrollDetectState());

  void challenge(bool value) {
    emit(state.copyWith(isChallenge: value));
  }
}

class ScrollDetectState extends Equatable {
  final bool isScroll;

  const ScrollDetectState({this.isScroll = false});

  @override
  List<Object?> get props => [isScroll];

  ScrollDetectState copyWith({bool? isChallenge}) {
    return ScrollDetectState(isScroll: isChallenge ?? isScroll);
  }
}

class ScrollDetective extends StatelessWidget {
  const ScrollDetective({
    super.key,
    this.bottom,
    required this.list,
    this.top,
    this.left,
    this.right,
  });
  final Widget list;
  final Widget? top;
  final Widget? left;
  final Widget? right;

  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrollDetectCubit(),
      child: BlocBuilder<ScrollDetectCubit, ScrollDetectState>(
        builder: (context, state) {
          return Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (noti) {
                  context.read<ScrollDetectCubit>().challenge(
                    noti.metrics.extentBefore != 0.0,
                  );
                  return true;
                },
                //Remove the Overlay of scroll Indicator
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: list,
                ),
              ),
              //
              if (state.isScroll && top != null)
                Align(alignment: Alignment.topCenter, child: top),
              if (state.isScroll && left != null)
                Align(alignment: Alignment.centerLeft, child: left),
              if (state.isScroll && right != null)
                Align(alignment: Alignment.centerRight, child: right),
              if (state.isScroll && bottom != null)
                Align(alignment: Alignment.bottomCenter, child: bottom),
            ],
          );
        },
      ),
    );
  }
}
