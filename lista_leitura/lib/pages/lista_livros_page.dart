import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';
import 'package:lista_leitura/widgets/linha_horizontal.dart';
import 'package:lista_leitura/widgets/lista_livros.dart';

class ListaLivrosPage extends StatefulWidget {
  const ListaLivrosPage({super.key});

  @override
  ListaLivrosPageState createState() => ListaLivrosPageState();
}

class ListaLivrosPageState extends State<ListaLivrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lista de Leitura...",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 19, 89, 146),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          backgroundColor: const Color.fromARGB(
                            255,
                            19,
                            89,
                            146,
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  LinhaHorizontal(),
                  ListaLivros(listaLivros: listaLivrosMock),
                  LinhaHorizontal(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38),
                child: VerticalDivider(
                  color: Color.fromARGB(255, 175, 174, 174),
                  thickness: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
