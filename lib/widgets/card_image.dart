import 'package:flutter/material.dart';
import 'package:flutter_app/themes/default_theme.dart';

class CardImage extends StatelessWidget {
  final String urlImage;
  final String? captionImage;

  const CardImage({super.key, 
    required this.urlImage, 
    this.captionImage
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,      
        shadowColor: DefaultTheme.primary.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10,
        child: Column(children: [
          FadeInImage(
            placeholder: const AssetImage('assets/images/loading.gif'), 
            image: NetworkImage(urlImage),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
            fadeInDuration: const Duration(milliseconds: 600),
          ),
          if(captionImage != null)
            Container(              
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(captionImage ?? 'No caption',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
        ]),
      ),
    );
  }
}