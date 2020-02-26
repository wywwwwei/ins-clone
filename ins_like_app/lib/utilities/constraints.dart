import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle CustomLabelStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);

const TextStyle CustomHintStyle = TextStyle(
  color: Colors.black38,
);

final Decoration customBoxDecoration = BoxDecoration(
  color: Color(0xFFF5F4F4),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0,3),
    )
  ]
);