import 'package:flutter/material.dart';

/// Global key as the default key of [TerminalContainer] instance.
///
/// There's usually only one [TerminalContainer] widget in the whole app,
/// as it is recommended.
///
final terminalContainer = GlobalKey();

/// Tab shortcuts to show or hide terminal pad.
///
/// It is designed for desktop and will not be compatible with phones.
///
class TerminalContainer extends StatefulWidget {
  TerminalContainer({
    GlobalKey? key,
    this.terminalPad = const Center(child: Text('terminal pad')),
    this.mainArea = const Center(child: Text('main area')),
  }) : super(key: key ?? terminalContainer);

  final Widget terminalPad;
  final Widget mainArea;

  @override
  State<TerminalContainer> createState() => _TerminalContainerState();
}

class _TerminalContainerState extends State<TerminalContainer> {
  // Controller of show or hide terminal pad.
  bool _show = false;
  bool get show => _show;
  set show(bool flag) {
    if (_show != flag) {
      setState(() => _show = flag);
    }
  }

  /// Terminal pad display.
  Widget get terminal {
    return Positioned(
      child: widget.terminalPad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: _show ? [widget.mainArea, terminal] : [widget.mainArea],
    );
  }
}