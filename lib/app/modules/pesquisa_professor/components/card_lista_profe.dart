import 'package:flutter/material.dart';
import 'package:hiperprooftwo/app/components/hp_text_title.dart';
import 'package:hiperprooftwo/data/models/professor_model.dart';

class CardListaProfe extends StatelessWidget {
  final Professor professor;
  const CardListaProfe({super.key, required this.professor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            child: Visibility(
              visible: false,
              replacement: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://github.com/epannunzio.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HpTextTitle(
                text: 'Treinaweb',
                size: HPSizeTitle.small,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.grey[800],
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'R\$ 50,00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Text(
                'Ministro aulas da lingua italiana para crianças e adultos',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
