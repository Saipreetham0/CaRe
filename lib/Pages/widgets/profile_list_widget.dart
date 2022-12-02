import 'package:flutter/material.dart';

class profileListViewWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;
  final bool hasNavigation;
  const profileListViewWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.hasNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          // color: tPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          // color: isDark ? tPrimaryColor : Theme.of(context).iconTheme.color,
        ),
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: hasNavigation
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
            )
          : null,
    );
  }
}
