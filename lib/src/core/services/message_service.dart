import 'package:easy_localization/easy_localization.dart' as l;
import 'package:flutter/material.dart';
import 'dart:async';

///
enum MessageType { success, error, warning, info, init }

///
class MessageEntry {
  final String id;
  final String message;
  final MessageType type;
  final DateTime timestamp;
  Timer? _timer;

  MessageEntry({
    required this.id,
    required this.message,
    required this.type,
    required this.timestamp,
  });

  void startTimer(VoidCallback onExpired, Duration duration) {
    _timer = Timer(duration, onExpired);
  }

  void cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}

class MessageToteController extends ChangeNotifier {
  final List<MessageEntry> _messages = [];
  static const int _maxVisibleMessages = 3;

  List<MessageEntry> get visibleMessages =>
      _messages.take(_maxVisibleMessages).toList();

  bool get hasData => _messages.isNotEmpty;

  void show({
    required String message,
    required MessageType type,
    required Duration duration,
  }) {
    final entry = MessageEntry(
      id: UniqueKey().toString(),
      message: message,
      type: type,
      timestamp: DateTime.now(),
    );

    entry.startTimer(() => dismiss(entry.id), duration);
    _messages.insert(0, entry);

    if (_messages.length > _maxVisibleMessages) {
      _messages.skip(_maxVisibleMessages).forEach((e) => e.cancelTimer());
      _messages.removeRange(_maxVisibleMessages, _messages.length);
    }

    notifyListeners();
  }

  void dismiss(String id) {
    final index = _messages.indexWhere((entry) => entry.id == id);
    if (index != -1) {
      final entry = _messages.removeAt(index);
      entry.cancelTimer();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    for (var entry in _messages) {
      entry.cancelTimer();
    }
    _messages.clear();
    super.dispose();
  }
}

///
class MessageToteConfig {
  final Map<MessageType, Color> colors;
  final Map<MessageType, IconData> icons;
  final TextStyle textStyle;
  final EdgeInsetsGeometry margin;
  final Duration displayDuration;
  final Curve animationCurve;
  final Duration animationDuration;
  final double elevation;
  final int maxVisibleMessages;

  const MessageToteConfig({
    this.colors = const {
      MessageType.success: Color(0xFF4CAF50),
      MessageType.error: Color(0xFFF44336),
      MessageType.warning: Color(0xFFFF9800),
      MessageType.info: Color(0xFF2196F3),
      MessageType.init: Colors.white,
    },
    this.icons = const {
      MessageType.success: Icons.check_circle,
      MessageType.error: Icons.error,
      MessageType.warning: Icons.warning,
      MessageType.info: Icons.info,
      MessageType.init: Icons.info,
    },
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    this.margin = const EdgeInsets.all(16),
    this.displayDuration = const Duration(seconds: 4),
    this.animationCurve = Curves.fastOutSlowIn,
    this.animationDuration = const Duration(milliseconds: 300),
    this.elevation = 6,
    this.maxVisibleMessages = 3,
  });
}

class MessageToteWidget extends StatefulWidget {
  final MessageToteConfig config;

  const MessageToteWidget({super.key, this.config = const MessageToteConfig()});

  @override
  State<MessageToteWidget> createState() => _MessageToteWidgetState();
}

class _MessageToteWidgetState extends State<MessageToteWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late final MessageToteController _controller;
  final List<MessageEntry> _previousMessages = [];

  bool _initialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _controller = MessageTote.of(context).controller;

      _controller.removeListener(_handleMessagesChanged);
      _controller.addListener(_handleMessagesChanged);
      _initializeExistingMessages();
      _initialized = true;
    }
  }

  void _initializeExistingMessages() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var i = 0; i < _controller.visibleMessages.length; i++) {
        _listKey.currentState?.insertItem(i);
        // _messageIds.add(_controller.visibleMessages[i].id);
      }
    });
  }

  void _handleMessagesChanged() {
    final newMessages = _controller.visibleMessages;
    final oldMessages = List<MessageEntry>.from(_previousMessages);

    final newIds = newMessages.map((e) => e.id).toList();
    final oldIds = oldMessages.map((e) => e.id).toList();

    // Create copies to avoid concurrent modification
    final removedIds = oldIds.where((id) => !newIds.contains(id)).toList();
    final addedIds = newIds.where((id) => !oldIds.contains(id)).toList();

    // Handle removals first
    for (final id in removedIds) {
      final entry = oldMessages.firstWhere((e) => e.id == id);
      final index = oldMessages.indexWhere((e) => e.id == id);
      // if (currentIndex != -1 && currentIndex < _messageIds.length) {
      if (index != -1) {
        _listKey.currentState?.removeItem(
          index,
          (context, animation) => _buildRemovedItem(entry, animation),
          duration: widget.config.animationDuration,
        );
      }
    }

    // Handle additions after removals
    for (final id in addedIds) {
      final newIndex = newMessages.indexWhere((e) => e.id == id);
      if (newIndex != -1) {
        _listKey.currentState?.insertItem(newIndex);
      }
    }
    // Sync the ID list after all operations
    _previousMessages
      ..clear()
      ..addAll(newMessages);
  }

  Widget _buildRemovedItem(MessageEntry entry, Animation<double> animation) {
    return _MessageItem(
      entry: entry,
      animation: animation,
      config: widget.config,
      onDismiss: () => _controller.dismiss(entry.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (_controller.visibleMessages.isEmpty) {
    //   return const SizedBox.shrink();
    // }
    // if (_controller._messages.isEmpty) {
    //   return const SizedBox.shrink();
    // }
    return Stack(
      children: [
        Positioned(
          bottom: widget.config.margin.resolve(TextDirection.ltr).bottom,
          left: widget.config.margin.resolve(TextDirection.ltr).left,
          right: widget.config.margin.resolve(TextDirection.ltr).right,
          child: AnimatedList(
            key: _listKey,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            initialItemCount: 0,
            itemBuilder: (context, index, animation) {
              if (index >= _controller.visibleMessages.length) {
                return const SizedBox.shrink();
              }
              final entry = _controller.visibleMessages[index];
              return _MessageItem(
                key: ValueKey(entry.id),
                entry: entry,
                animation: animation,
                config: widget.config,
                onDismiss: () => _controller.dismiss(entry.id),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MessageItem extends StatelessWidget {
  final MessageEntry entry;
  final Animation<double> animation;
  final MessageToteConfig config;
  final VoidCallback onDismiss;

  const _MessageItem({
    super.key,
    required this.entry,
    required this.animation,
    required this.config,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Material(
            elevation: config.elevation,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: config.colors[entry.type],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(config.icons[entry.type], color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      context.tr(entry.message),
                      style: config.textStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    color: Colors.white.withValues(alpha: 0.8),
                    onPressed: onDismiss,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageTote extends InheritedWidget {
  static MessageToteController? _controller;
  static MessageToteConfig? _config;

  final MessageToteController controller;
  final MessageToteConfig config;

  MessageTote({
    super.key,
    required super.child,
    required this.controller,
    this.config = const MessageToteConfig(),
  }) {
    _controller = controller;
    _config = config;
  }

  // static MessageToteController k = MessageToteController();

  static MessageTote of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MessageTote>()!;
  }

  @override
  bool updateShouldNotify(MessageTote oldWidget) {
    return config != oldWidget.config || controller != oldWidget.controller;
  }

  // Static access method
  static void show({
    required String message,
    required MessageType type,
    Duration? duration,
  }) {
    _controller?.show(
      message: message,
      type: type,
      duration:
          duration ?? _config?.displayDuration ?? const Duration(seconds: 3),
    );
  }

  // Static dismiss method
  static void dismiss(String id) {
    _controller?.dismiss(id);
  }

  static Widget builder(BuildContext context, Widget? child) {
    // final messageController = MessageToteController();

    return MessageToteBuilder(
      builder: (context, controller) {
        // Use a provider or similar to get the existing controller
        // Or create it once and reuse
        return MessageTote(
          controller: controller,
          child: MessageToteOverlay(child: child),
        );
      },
    );
  }
}

// Update MessageTote to include a StatefulWidget that manages the controller
class MessageToteBuilder extends StatefulWidget {
  final Widget Function(BuildContext, MessageToteController) builder;

  const MessageToteBuilder({super.key, required this.builder});

  @override
  State<MessageToteBuilder> createState() => _MessageToteBuilderState();
}

class _MessageToteBuilderState extends State<MessageToteBuilder> {
  final MessageToteController _controller = MessageToteController();

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}

class MessageToteOverlay extends StatefulWidget {
  final Widget? child;

  const MessageToteOverlay({super.key, required this.child});

  @override
  State<MessageToteOverlay> createState() => _MessageToteOverlayState();
}

class _MessageToteOverlayState extends State<MessageToteOverlay> {
  late final MessageToteController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the controller from the InheritedWidget
    _controller = MessageTote.of(context).controller;
    _controller.addListener(_handleControllerUpdate);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerUpdate);
    super.dispose();
  }

  void _handleControllerUpdate() {
    // Rebuild this widget when the controller changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your main content
        if (widget.child != null) widget.child!,
        // Conditionally show MessageToteWidget
        if (_controller.hasData)
          const Align(
            alignment: Alignment.bottomCenter,
            child: MessageToteWidget(),
          ),
      ],
    );
  }
}
