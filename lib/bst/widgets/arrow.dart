import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget arrow(modalObj) => Row(children: [
      modalObj.left != null
          ? Transform.rotate(
              angle: 60 * math.pi / 180,
              child: const Icon(
                Icons.arrow_downward,
                size: 30,
              ),
            )
          : const SizedBox(),
      modalObj.right != null
          ? Transform.rotate(
              angle: 300 * math.pi / 180,
              child: const Icon(
                Icons.arrow_downward,
                size: 30,
              ),
            )
          : const SizedBox(),
    ]);
