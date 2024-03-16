import 'package:alqatareyacontracts/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'حدث خطأ',
        style: Styles.style20,
      ),
    );
  }
}
