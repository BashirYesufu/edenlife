import 'package:flutter/material.dart';

class EdenPrimaryButton extends StatelessWidget {
  final String? label;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final Function()? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool enabled;

  const EdenPrimaryButton({
    this.onTap,
    this.label,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.borderColor,
    this.child,
    this.padding,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: borderColor ?? (enabled ? (backgroundColor ?? Theme.of(context).primaryColor) : Colors.grey),
                width: 1.0,
              )
          ),
          child: MaterialButton(
            splashColor: backgroundColor?.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: enabled ? onTap : null,
            minWidth: double.infinity,
            height: 48,
            child: child ?? Text(
              label ?? '',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
