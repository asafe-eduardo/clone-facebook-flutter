import 'package:facebook_interface_aula/componentes/area_criar_postagem.dart';
import 'package:facebook_interface_aula/componentes/area_estoria.dart';
import 'package:facebook_interface_aula/componentes/botao_circulo.dart';
import 'package:facebook_interface_aula/componentes/cartao_postagem.dart';
import 'package:facebook_interface_aula/componentes/lista_contatos.dart';
import 'package:facebook_interface_aula/componentes/lista_opcoes.dart';
import 'package:facebook_interface_aula/dados/dados.dart';
import 'package:facebook_interface_aula/modelos/modelos.dart';
import 'package:facebook_interface_aula/telas/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:line_icons/line_icons.dart';

import '../uteis/paleta_cores.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivo(
        mobile: HomeMobile(),
        tablet: HomeTablet(),
        desktop: HomeDesktop(),
      )
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          // expandedHeight: 250,
          floating: true,
          centerTitle: false,
          title: Text(
            "facebook",
            style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
            ),
          ),
          actions: [
            BotaoCirculo(
              icone: LineIcons.search,
              iconeTamanho: 30,
              onPressed: (){},
            ),
            BotaoCirculo(
              icone: LineIcons.facebookMessenger,
              iconeTamanho: 30,
              onPressed: (){},
            )
          ],
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStoria(
                usuario: usuarioAtual,
                estorias: estorias
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, indice){
                  Postagem  postagem = postagens[indice];
                  return CartaoPostagem(
                      postagem: postagem
                  );
                },
                childCount: postagens.length
            )

        )
      ],
    );
  }
}

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          // expandedHeight: 250,
          floating: true,
          centerTitle: false,
          title: Text(
            "facebook",
            style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
            ),
          ),
          actions: [
            BotaoCirculo(
              icone: LineIcons.search,
              iconeTamanho: 30,
              onPressed: (){},
            ),
            BotaoCirculo(
              icone: LineIcons.facebookMessenger,
              iconeTamanho: 30,
              onPressed: (){},
            )
          ],
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStoria(
                usuario: usuarioAtual,
                estorias: estorias
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, indice){
                  Postagem  postagem = postagens[indice];
                  return CartaoPostagem(
                      postagem: postagem
                  );
                },
                childCount: postagens.length
            )

        )
      ],
    );
  }
}


class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ListaOpcoes(
              usuario: usuarioAtual,
            )
          )
        ),
        Spacer(),
        Flexible(
            flex: 5,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: AreaStoria(
                        usuario: usuarioAtual,
                        estorias: estorias
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AreaCriarPostagem(
                    usuario: usuarioAtual,
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                            (context, indice){
                          Postagem  postagem = postagens[indice];
                          return CartaoPostagem(
                              postagem: postagem
                          );
                        },
                        childCount: postagens.length
                    )

                )
              ],
            )
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaContatos(
                usuarios: usuariosOnline,
              ),
            )
        ),
      ],
    );
  }
}
