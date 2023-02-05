import 'package:flutter/material.dart';

class TitleLargeWidget extends StatelessWidget {
  final String title;
  const TitleLargeWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.start,
    );
  }
}

class TitleMediumWidget extends StatelessWidget {
  final String title;
  const TitleMediumWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      textAlign: TextAlign.start,
    );
  }
}

class TitleSmalltWidget extends StatelessWidget {
  final String subtitle;
  const TitleSmalltWidget({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

class DescriptionTextWidget extends StatelessWidget {
  final String description;
  const DescriptionTextWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class WhiteTitleLargeWidget extends StatelessWidget {
  final String title;
  const WhiteTitleLargeWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.white,
      ),
    );
  }
}
