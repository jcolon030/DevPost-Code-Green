// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Bar Push',
      home: BarList(),
    );
  }
}

class BarList extends StatefulWidget {
  const BarList({super.key});

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList> {
  final _words = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bar Push')),
      body: _buildBarList(),
    );
  }

  Widget _buildBarList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;
        if (index >= _words.length) {
          _words.addAll(generateWordPairs()
              .take(10)); // Generates random words, replace with bar list
        }
        return _buildRow(_words[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));
  }
}
