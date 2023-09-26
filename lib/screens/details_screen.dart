import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Recibir argumentos de otra pantalla
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
        //Widget con comportamientos predefinidos al scroll
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                _PosterAndTitle(),
                _Overview(),
                RepartoSlider(),
                

              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //wIDGET PARA QUE SE AGUSTE AL TAMAÑO
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //Eliminar padding
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/no-image.jpg'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 250,
            ),
          ),
          SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.title',
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'movie.titleOriganl',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'movie.voteAverage',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,
       vertical: 10
       ),
       child: Text('Deserunt amet laboris laborum cillum adipisicing Lorem sint ullamco velit labore consequat. Aliquip pariatur irure quis eiusmod consectetur amet mollit ipsum. Nostrud pariatur minim veniam dolor consectetur minim nostrud mollit. Nostrud consequat laborum deserunt nostrud ea elit mollit nulla voluptate ipsum duis aliqua enim ea. Nulla fugiat sint irure ad sint enim enim culpa. Dolore dolor sunt velit pariatur duis elit est culpa veniam dolor eiusmod deserunt. Adipisicing proident ipsum quis exercitation amet laborum veniam ullamco reprehenderit aliquip.',
       textAlign: TextAlign.justify,
       style: TextStyle(fontSize: 15),
       ),
    );
  }
}

class RepartoSlider extends StatelessWidget {
  const RepartoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Reparto',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => _RepartoPoster(),
            ),
          )
        ],
      ),
    );
  }
}

class _RepartoPoster extends StatelessWidget {
  const _RepartoPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                width: 130,
                height: 165,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Aliqua amet qui elit ad irure anim ullamco sit deserunt nisi eiusmod excepteur nisi sunt.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

