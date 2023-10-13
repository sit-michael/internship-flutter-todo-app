import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, future) {
        final versionString = future.connectionState == ConnectionState.done &&
                future.data != null
            ? 'Version ${future.data!.version} (${future.data!.buildNumber})'
            : 'Version Unknown';
        return Text(
          'Schwarz IT KG\n$versionString',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        );
      },
    );
  }
}
