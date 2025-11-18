import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget showing every AvatarSize value
class AvatarSizesPreview extends StatelessWidget {
  const AvatarSizesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Wrap(
            spacing: AppTheme.spaceLg,
            runSpacing: AppTheme.spaceLg,
            alignment: WrapAlignment.center,
            children: AvatarSize.values
                .map(
                  (size) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Avatar(fallbackName: 'Taylor Reed', size: size),
                      const SizedBox(height: 8),
                      Text(size.name.toUpperCase()),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
