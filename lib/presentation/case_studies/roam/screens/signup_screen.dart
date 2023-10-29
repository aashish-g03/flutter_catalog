import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercatalog/presentation/case_studies/roam/widgets/custom_button.dart';
import 'package:fluttercatalog/presentation/case_studies/roam/widgets/custom_text_form_field.dart';
import 'package:fluttercatalog/presentation/case_studies/roam/widgets/spaces.dart';
import 'package:fluttercatalog/presentation/layout/adaptive.dart';
import 'package:fluttercatalog/values/values.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SvgPicture.asset(RoamImagePath.LIGHT_ELLIPSE, fit: BoxFit.cover),
                Container(
                  height: assignHeight(context: context, fraction: 1.0),
                  child: _socialLogin(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialLogin(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = assignWidth(context: context, fraction: 1.0);
    TextStyle? hintTextStyle = theme.textTheme.bodyMedium;
    TextStyle? titleTextStyle = theme.textTheme.titleLarge;
    TextStyle? formTextStyle = theme.textTheme.titleMedium?.copyWith(
      color: RoamAppColors.black50,
    );
    return Column(
      children: [
        Spacer(),
        Text(
          StringConst.SIGN_UP,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: RoamAppColors.secondaryColor,
          ),
        ),
        SpaceH20(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: width * 0.35,
              child: CustomButton(
                onPressed: () {},
                borderRadius: Sizes.RADIUS_8,
                color: RoamAppColors.white,
                title: StringConst.GOOGLE,
                icon: Image.asset(
                  RoamImagePath.GOOGLE,
                  width: Sizes.WIDTH_24,
                  height: Sizes.HEIGHT_24,
                ),
              ),
            ),
            Container(
              width: width * 0.35,
              child: CustomButton(
                onPressed: () {},
                borderRadius: Sizes.RADIUS_8,
                color: RoamAppColors.white,
                title: StringConst.FACEBOOK,
                icon: Icon(
                  FontAwesomeIcons.facebookSquare,
                  color: RoamAppColors.facebookBlue,
                ),
              ),
            ),
          ],
        ),
        SpaceH20(),
        Text(
          StringConst.OR,
          style: theme.textTheme.bodyText1,
        ),
        SpaceH20(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
          child: CustomTextFormField(
            hasTitle: true,
            fieldTitle: StringConst.EMAIL,
            fieldTitleTextStyle: titleTextStyle,
            textFormFieldStyle: formTextStyle,
            hintText: StringConst.EMAIL_HINT_TEXT,
            prefixIconColor: RoamAppColors.primaryColor,
            hintTextStyle: hintTextStyle,
            filled: true,
            fillColor: RoamAppColors.white,
            borderStyle: BorderStyle.solid,
          ),
        ),
        SpaceH16(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
          child: CustomTextFormField(
            hasTitle: true,
            fieldTitle: StringConst.PASSWORD,
            fieldTitleTextStyle: titleTextStyle,
            textFormFieldStyle: formTextStyle,
            hintText: StringConst.PASSWORD_HINT_TEXT,
            prefixIconColor: RoamAppColors.primaryColor,
            hintTextStyle: hintTextStyle,
            filled: true,
            fillColor: RoamAppColors.white,
            obscured: true,
            borderStyle: BorderStyle.solid,
          ),
        ),
        SpaceH16(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
            child: CustomTextFormField(
              hasTitle: true,
              fieldTitle: StringConst.CONFIRM_PASSWORD,
              fieldTitleTextStyle: titleTextStyle,
              textFormFieldStyle: formTextStyle,
              hintText: StringConst.PASSWORD_HINT_TEXT,
              prefixIconColor: RoamAppColors.primaryColor,
              hintTextStyle: hintTextStyle,
              filled: true,
              fillColor: RoamAppColors.white,
              obscured: true,
              borderStyle: BorderStyle.solid,
            )),
        SpaceH30(),
        Container(
          height: Sizes.HEIGHT_56,
          margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_24),
          child: CustomButton(
            onPressed: () {},
            borderRadius: Sizes.RADIUS_8,
            title: StringConst.SIGN_UP,
            textStyle: theme.textTheme.titleLarge?.copyWith(
              color: RoamAppColors.white,
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            AutoRouter.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.only(
              bottom: Sizes.PADDING_2, // space between underline and text
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: RoamAppColors.secondaryColor, // Text colour here
                  width: Sizes.WIDTH_1, // Underline width
                ),
              ),
            ),
            child: RichText(
              text: TextSpan(
                text: StringConst.ALREADY_HAVE_AN_ACCOUNT,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: RoamAppColors.secondaryColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: StringConst.LOG_IN,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: RoamAppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SpaceH16(),
      ],
    );
  }
}
