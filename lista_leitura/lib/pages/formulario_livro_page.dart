import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';

class FormularioLivroPage extends StatefulWidget {
  FormularioLivroPage({this.livro, required this.onCadastrar});

  final LivroModel? livro;
  final Function(LivroModel) onCadastrar;

  @override
  _FormularioLivroPage createState() => _FormularioLivroPage();
}

class _FormularioLivroPage extends State<FormularioLivroPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LivroModel livro;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    livro =
        widget.livro ??
        LivroModel(id: Random().nextInt(255), titulo: '', descricao: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 10),
              child: Text(
                "Inclua seu nomo livro",
                style: TextStyle(
                  color: const Color.fromARGB(255, 19, 89, 146),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: TextFormField(
                initialValue: livro.titulo,
                decoration: InputDecoration(
                  hintText: "Título",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onSaved: (titulo) => livro.titulo = titulo!,
                validator:
                    (titulo) => titulo!.isEmpty ? "Título é obrigatório" : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: TextFormField(
                initialValue: livro.descricao,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Descrição",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onSaved: (descricao) => livro.descricao = descricao!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                children: [
                  Text("Já li esse livro"),
                  Checkbox(
                    value: livro.lido,
                    onChanged: (valor) {
                      setState(() {
                        livro.lido = valor!;
                      });
                    },
                    activeColor: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    widget.onCadastrar(livro);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 19, 89, 146),
                ),
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
