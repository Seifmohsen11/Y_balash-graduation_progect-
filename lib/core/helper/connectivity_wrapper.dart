import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;
  const ConnectivityWrapper({super.key, required this.child});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  bool? _wasConnected;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();

    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      final hasConnection = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi);

      _handleConnectionChange(hasConnection);
    });
  }

  Future<void> _checkInitialConnection() async {
    final results = await Connectivity().checkConnectivity();
    final hasConnection = results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);

    _wasConnected = hasConnection;

    if (!hasConnection) {
      await Future.delayed(const Duration(seconds: 3));
      showSnackBar(
        context,
        "No internet connection",
        backgroundColor: Colors.red,
        icon: Icons.wifi_off,
      );
    }
  }

  void _handleConnectionChange(bool hasConnection) {
    if (_wasConnected != null && _wasConnected != hasConnection) {
      if (hasConnection) {
        showSnackBar(
          context,
          "Back online",
          backgroundColor: Colors.green,
          icon: Icons.wifi,
        );
      } else {
        showSnackBar(
          context,
          "No internet connection",
          backgroundColor: Colors.red,
          icon: Icons.wifi_off,
        );
      }
    }
    _wasConnected = hasConnection;
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
