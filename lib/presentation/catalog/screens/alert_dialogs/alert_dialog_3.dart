import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttercatalog/presentation/catalog/widgets/spaces.dart';
import 'package:fluttercatalog/presentation/layout/adaptive.dart';
import 'package:fluttercatalog/values/values.dart';

class AlertDialog3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => _buildDialog(context),
              );
            },
            child: Text(StringConst.SHOW_ALERT),
          ),
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Radius borderRadius = const Radius.circular(Sizes.RADIUS_60);
    return Dialog(
      backgroundColor: AppColors.violet400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: borderRadius,
          bottomLeft: borderRadius,
        ),
      ),
      elevation: Sizes.ELEVATION_8,
      child: Container(
        padding: const EdgeInsets.all(Sizes.MARGIN_30),
        height: assignHeight(context: context, fraction: 0.33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConst.CONFIRM,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppColors.white,
              ),
            ),
            SpaceH8(),
            Text(
              StringConst.LOREM_IPSUM,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.purple50,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => closeDialog(context),
                  backgroundColor: AppColors.pink50,
                  child: Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                ),
                SpaceW8(),
                FloatingActionButton(
                  onPressed: () => closeDialog(context),
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.done,
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void closeDialog(BuildContext context) {
    AutoRouter.of(context).pop();
  }
}
