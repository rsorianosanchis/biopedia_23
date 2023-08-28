import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/actor.dart';

class ActorsHorizontalListview extends StatelessWidget {

  final List<Actor> ? actors;
  const ActorsHorizontalListview({super.key, this.actors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: (actors == null)?const SizedBox():
      
      Column(
        children: [
          Expanded(
              child: ListView.builder( 
                itemCount: actors!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeInRight(child: _Slide(actor: actors![index]));
                },
              )
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Actor actor;
  const _Slide({required this.actor});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        
        children: [
          // IMAGE *
          SizedBox(
            
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                actor.profilePath!,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ));
                  }
                  // return CircularProgressIndicator(strokeWidth: 2,);
                  //
                  return child;
                },
              ),
            ),
          ),
          // SPACER *
          const SizedBox(
            height: 5,
          ),
          // TITLE
          SizedBox(
            width: 150,
            child: Text(
              actor.name,
              maxLines: 2,
              style: textStyles.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          //RATES
        ],
      ),
    );
  }
}


