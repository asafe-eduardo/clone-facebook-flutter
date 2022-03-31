import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface_aula/componentes/imagem_perfil.dart';
import 'package:facebook_interface_aula/modelos/modelos.dart';
import 'package:facebook_interface_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {

  final Postagem postagem;

  const CartaoPostagem({
    Key? key,
    required this.postagem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      child:  Column(
        children: [
          //cabecalho
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabecalhoPostagem(
                    postagem: postagem
                ),
                Text(postagem.descricao)
              ],
            ),
          ),


          //imagem da postagem
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(imageUrl: postagem.urlImagem,),
          ),


          //estatiscas da postagem
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: EstatisticasPostagem(
              postagem: postagem,
            ),
          ),
        ],
      ),
    );
  }
}

class BotaoPostagem extends StatelessWidget {

  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  const BotaoPostagem({
    Key? key,
    required this.icone,
    required this.texto,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Container(
              child: Row(
                children: [
                  icone,
                  SizedBox(width: 4,),
                  Text(
                    texto,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}


class EstatisticasPostagem extends StatelessWidget {

  final Postagem postagem;

  const EstatisticasPostagem({
    Key? key,
    required this.postagem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
                  "${postagem.curtidas}",
                  style: TextStyle(
                      color: Colors.grey[700]
                  ),
                ),
            ),
            Text(
              "${postagem.comentarios} comentários",
              style: TextStyle(
                  color: Colors.grey[700]
              ),
            ),
            SizedBox(width: 8,),
            Text(
              "${postagem.compartilhamentos} compartilhamentos",
              style: TextStyle(
                  color: Colors.grey[700]
              ),
            )
          ],
        ),
        Divider(thickness: 1.2,),
        Row(
          children: [
            BotaoPostagem(
                icone: Icon(
                  LineIcons.thumbsUpAlt,
                  color: Colors.grey[700],
                ),
                texto: "Curtir",
                onTap: (){},
            ),
            BotaoPostagem(
              icone: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              texto: "Postagem",
              onTap: (){},
            ),
            BotaoPostagem(
              icone: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              texto: "Compartilhar",
              onTap: (){},
            ),
          ],
        )
      ],
    );
  }
}


class CabecalhoPostagem extends StatelessWidget {

  final Postagem postagem;

  const CabecalhoPostagem({
    Key? key,
    required this.postagem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
            urlImagem: postagem.usuario.urlImagem,
            foiVisualizado: true,
        ),
        SizedBox(width: 8,),
        Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postagem.usuario.nome,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${postagem.tempoAtras} - ",
                      style: TextStyle(
                          color: Colors.grey[200]
                      ),
                    ),
                    Icon(
                      Icons.public,
                      size: 12,
                      color: Colors.grey[600],
                    )
                  ],
                )
              ],
            ),
        ),
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz)
        )
      ],
    );
  }
}
