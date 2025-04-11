import 'package:flutter/material.dart';
import 'package:lista_leitura/widgets/linha_horizontal.dart';

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
                        backgroundColor: const Color.fromARGB(255, 19, 89, 146),
                        child: Icon(Icons.add, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
                LinhaHorizontal(),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 58),
                        child: Text(
                          "Código Limpo",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 58),
                        child: Text(
                          "Uma descrição qualquer",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.all(0),
                    );
                  },
                  separatorBuilder: (context, i) => LinhaHorizontal(),
                  itemCount: 5,
                ),
                LinhaHorizontal(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: VerticalDivider(
                color: const Color.fromARGB(255, 175, 174, 174),
                thickness: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
