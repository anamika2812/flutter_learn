import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: TextStyle(
              color: Colors.purple[900],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            doc["creation_date"],
            style: TextStyle(color: Colors.purple[900]),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            doc["note_content"],
            style: TextStyle(
              color: Colors.purple[900],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
