part of '../home_view.dart';

class _ActiveChip extends StatelessWidget {
  const _ActiveChip(this.tag);
  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tag.name ?? '',
        style: context.general.textTheme.bodySmall?.copyWith(
          color: ColorConstants.white,
        ),
      ),
      backgroundColor: ColorConstants.purplePrimary,
      padding: context.padding.low,
    );
  }
}

class _PassiveChip extends StatelessWidget {
  const _PassiveChip(this.tag);
  final Tag tag;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tag.name ?? '',
        style: context.general.textTheme.bodySmall?.copyWith(
          color: ColorConstants.greyPrimary,
        ),
      ),
      backgroundColor: ColorConstants.greyLighter,
      padding: context.padding.low,
    );
  }
}
