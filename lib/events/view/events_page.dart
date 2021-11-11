import 'package:flutter/material.dart';

class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem({Key? key}) : super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  // static const height = 298.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              // This ensures that the Card's children (including the ink splash) are clipped correctly.
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                // Generally, material cards use onSurface with 12% opacity for the pressed state.
                splashColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                // Generally, material cards do not have a highlight overlay.
                highlightColor: Colors.transparent,
                child: TravelDestinationContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5!.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: Ink(
                  color: Colors.teal,
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Proteção radiológica na prática clínica',
                    style: titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Evento ocorre de 27/10/2021 até 11/11/2021'),
                ),
                ListTile(
                  leading: Icon(Icons.history_edu),
                  title: Text('Inscrições de 27/10/2021 até 11/11/2021'),
                ),
                ListTile(
                  leading: Icon(Icons.groups),
                  title: Text('50 pessoas'),
                ),
              ],
            ),
          ),
        ),
        // share, explore buttons
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Compartilhar'),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Compartilhar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
