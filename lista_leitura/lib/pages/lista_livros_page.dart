import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'package:lista_leitura/widgets/linha_horizontal.dart';
import 'package:lista_leitura/widgets/lista_livros.dart';

class ListaLivrosPage extends StatefulWidget {
  const ListaLivrosPage({super.key});

  @override
  ListaLivrosPageState createState() => ListaLivrosPageState();
}

class ListaLivrosPageState extends State<ListaLivrosPage> {

  late Set<LivroModel> meusLivros;

  late Function(LivroModel) onCadastrar;
  late Function(LivroModel) onDeletar;

  @override
  void initState() {
    meusLivros = {};
    onCadastrar = (LivroModel LivroModel) {
      setState(() {
        meusLivros.add(LivroModel);
      });
    };
    onDeletar = (LivroModel livroModel) {
      setState(() {
        meusLivros.remove(livroModel);
      });
    };
    super.initState();
  }

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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (_) => FormularioLivroPage(
                                      livro: null, // Pass a valid LivroModel instance or null if applicable
                                      onCadastrar: onCadastrar,
                                    ),
                              ),
                            );
                          },
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
                  ListaLivros(
                    listaLivros: meusLivros,
                    onCadastrar: onCadastrar,
                    onDeletar: onDeletar,
                  ),
                  if (meusLivros.isNotEmpty) LinhaHorizontal(),
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
