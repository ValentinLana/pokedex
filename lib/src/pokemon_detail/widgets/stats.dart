import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/src/helpers/capitalize.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key, required this.stats}) : super(key: key);

  final List<Stat>? stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Stats',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color.fromARGB(221, 39, 38, 38),
          ),
        ),
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatValue(
                stat: stats?[0].stat?.name ?? '',
                value: stats?[0].baseStat?.toString() ?? ''),
            StatValue(
                stat: stats?[5].stat?.name ?? '',
                value: stats?[5].baseStat?.toString() ?? ''),
          ],
        ),
        const SizedBox(height: 17),
        Row(
          children: [
            StatValue(
                stat: stats?[1].stat?.name ?? '',
                value: stats?[1].baseStat?.toString() ?? ''),
            StatValue(
                stat: stats?[2].stat?.name ?? '',
                value: stats?[2].baseStat?.toString() ?? ''),
          ],
        ),
        const SizedBox(height: 17),
        Row(
          children: [
            StatValue(
                stat: stats?[3].stat?.name ?? '',
                value: stats?[3].baseStat?.toString() ?? ''),
            StatValue(
                stat: stats?[4].stat?.name ?? '',
                value: stats?[4].baseStat?.toString() ?? ''),
          ],
        )
      ],
    );
  }
}

class StatValue extends StatelessWidget {
  const StatValue({Key? key, required this.stat, required this.value})
      : super(key: key);

  final String stat;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color.fromARGB(221, 39, 38, 38),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            stat.capitalize(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color.fromARGB(221, 39, 38, 38),
            ),
          ),
        ],
      ),
    );
  }
}
