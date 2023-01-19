import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LikesScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const LikesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('xdddd3333'),
            ),
          ],
        ),
      ),
    );
  }
}
