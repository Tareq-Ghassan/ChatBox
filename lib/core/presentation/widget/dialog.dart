import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/routes/route.dart';
import 'package:flutter/material.dart';

/// [CustomDialogBox] this is a Custom Widget to crete a Popup Widget
///
/// ex:
/// ```dart
// showDialog(
//   context: context,
//   builder: (context) {
//     return CustomDialogBox(
//       title: AppLocalizations.of(context)!.somethingWentWrong,
//       descriptions: "$e",
//       yesButtontext: AppLocalizations.of(context)!.exit,
//       yesButtonOnTap: () => Navigator.pop(context),
//     );
//   },
// );
/// ```
/// see also:
///
/// *[descriptions] must not be null, this represent the description text in
/// popup alert,
///
/// *[yesButtontext] must not be null, this represent the text for yes button,
///
/// *[title] property,
///
/// *[yesButtonOnTap] Function,
///
/// *[cancelButtontext] property,
///
/// *[cancelButtonOnTap] Function,
class CustomDialogBox extends StatefulWidget {
  ///Creates a [CustomDialogBox] Widget
  const CustomDialogBox({
    required this.title,
    required this.descriptions,
    this.yesButtontext,
    this.isYesButtonBlue = false,
    this.yesButtonIcon,
    super.key,
    this.cancelButtontext,
    this.cancelButtonOnTap,
    this.yesButtonOnTap,
  })  : assert(
          (cancelButtontext == null && cancelButtonOnTap == null) ||
              (cancelButtontext != null && cancelButtonOnTap != null),
          'Both cancelButtontext and cancelButtonOnTap must be provided'
          ' together',
        ),
        assert(
          (yesButtontext == null && yesButtonOnTap == null) ||
              (yesButtontext != null && yesButtonOnTap != null),
          'Both yesButtontext and yesButtonOnTap must be provided together',
        );

  /// [title] must not be null, this represent the Title in the Alert
  final String title;

  /// [cancelButtontext] this represent the text for No or Cancel button
  final String? cancelButtontext;

  /// [descriptions] must not be null, this represent the description text
  /// in popup alert,
  final String descriptions;

  /// [yesButtontext] must not be null, this represent the text for yes button,
  final String? yesButtontext;

  /// [isYesButtonBlue] a boolean for determine if yes button color is red or
  /// blue, by default is set false red
  final bool isYesButtonBlue;

  /// [yesButtonIcon] if this is passed an icon will show on yes button
  final Widget? yesButtonIcon;

  /// [cancelButtonOnTap] this is the onTap function for Cancel or No button
  final void Function()? cancelButtonOnTap;

  /// [yesButtonOnTap] this is the onTap function for yes button
  final void Function()? yesButtonOnTap;

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

/// [Constants] holds constants
class Constants {
  Constants._();

  ///[padding] padding 16
  static const double padding = 16;

  ///[avatarRadius] avatar radius 45
  static const double avatarRadius = 45;
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius, //+ Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding,
            ),
            margin: const EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  _space,
                  Text(
                    widget.descriptions,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  _space,
                  Row(
                    mainAxisAlignment: (widget.cancelButtontext != null &&
                            widget.yesButtontext != null)
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      if (widget.yesButtontext != null)
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: widget.yesButtonOnTap ?? KNavigator.pop,
                            style: widget.isYesButtonBlue
                                ? null
                                : const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      KColors.redColor,
                                    ),
                                  ),
                            child: Text(
                              widget.yesButtontext!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: KColors.white,
                                  ),
                            ),
                          ),
                        ),
                      if (widget.cancelButtontext != null)
                        SizedBox(
                          height: 54,
                          width: 110,
                          child: TextButton(
                            onPressed:
                                widget.cancelButtonOnTap ?? KNavigator.pop,
                            child: Text(
                              widget.cancelButtontext!,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const _space = SizedBox(
    height: 15,
  );
}
