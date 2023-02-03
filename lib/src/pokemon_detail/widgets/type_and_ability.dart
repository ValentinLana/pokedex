import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/src/helpers/capitalize.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';

class TypeAndAbility extends StatelessWidget {
  const TypeAndAbility({Key? key, this.abilities, this.types})
      : super(key: key);

  final List<Ability>? abilities;
  final List<Type>? types;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Type',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromARGB(221, 39, 38, 38),
                ),
              ),
              const SizedBox(height: 12),
              if (types != null)
                for (Type t in types!)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(t.type?.name?.capitalize() ?? ''),
                      ],
                    ),
                  )
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ability',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromARGB(221, 39, 38, 38),
                ),
              ),
              const SizedBox(height: 12),
              if (abilities != null)
                for (Ability a in abilities!)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(a.ability?.name?.capitalize() ?? ''),
                      ],
                    ),
                  )
            ],
          ),
        )
      ],
    );
  }
}
