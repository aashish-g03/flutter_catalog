import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttercatalog/presentation/catalog/widgets/container_handle.dart';
import 'package:fluttercatalog/presentation/catalog/widgets/custom_button.dart';
import 'package:fluttercatalog/presentation/catalog/widgets/spaces.dart';
import 'package:fluttercatalog/presentation/layout/adaptive.dart';
import 'package:fluttercatalog/values/values.dart';

class BottomSheet2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Radius borderRadius = const Radius.circular(Sizes.RADIUS_60);
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: borderRadius,
                  ),
                ),
                builder: (_) => _buildBottomSheet(context),
              );
            },
            child: Text(StringConst.SHOW_BOTTOM_SHEET),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(
        top: Sizes.PADDING_12,
        left: Sizes.PADDING_24,
        right: Sizes.PADDING_24,
        bottom: Sizes.PADDING_16,
      ),
      height: assignHeight(context: context, fraction: 0.5),
      child: Column(
        children: [
          ContainerHandle(),
          Spacer(),
          Text(
            StringConst.GUEST_INFO,
            style: theme.textTheme.headline6,
          ),
          SpaceH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImagePath.AVA),
                radius: 32,
              ),
              SpaceW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.YOGA_TIME,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.purple10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      StringConst.YOGA_TITLE,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          CustomButton(
            title: StringConst.TELL_FRIENDS,
            color: AppColors.indigo100,
            icon: Icon(FeatherIcons.share2, color: AppColors.white),
            textStyle: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
            ),
            onPressed: () => closeDialog(context),
          ),
          SpaceH16(),
          CustomButton(
            title: StringConst.DONE,
            color: AppColors.primaryColor,
            textStyle: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
            ),
            onPressed: () => closeDialog(context),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void closeDialog(BuildContext context) {
    AutoRouter.of(context).pop();
  }
}
