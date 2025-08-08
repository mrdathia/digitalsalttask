import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_colors.dart';

class ExpandedElevatedButton extends ConsumerWidget {
  const ExpandedElevatedButton({super.key, required this.childWidget, required this.onPressed});

  final VoidCallback onPressed;

  final Widget childWidget;

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: onPressed,
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
