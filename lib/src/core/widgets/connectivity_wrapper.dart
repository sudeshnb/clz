import 'package:clz/src/core/network/network_info.dart';
import 'package:clz/src/core/network/cubit/connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (state is Disconnected)
              const Positioned.fill(child: ConnectivityOverlay()),
          ],
        );
      },
    );
  }
}

class ConnectivityOverlay extends StatelessWidget {
  const ConnectivityOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.wifi_off, size: 50, color: Colors.red),
              const SizedBox(height: 20),
              const Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Please check your network settings'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                // onPressed: () {
                //   final NetworkInfo networkInfo = getIt<NetworkInfo>();
                //   networkInfo.checkConnection();
                // },
                onPressed: () => context.read<NetworkInfo>().checkConnection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
