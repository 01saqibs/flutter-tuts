import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerClass extends StatefulWidget {
  const ShimmerClass({Key? key}) : super(key: key);

  @override
  State<ShimmerClass> createState() => _ShimmerClassState();
}

class _ShimmerClassState extends State<ShimmerClass> {
  @override
  Widget build(BuildContext context) {
    bool enabled = true;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.black26,
                highlightColor: Colors.black12,
                enabled: enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SharePlusExample extends StatelessWidget {
  const SharePlusExample

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            await Share.share(
              'Hey i shared these texts from app',
              subject: 'Flutter-learning app!',
            );
            // ignore: use_build_context_synchronously
          },
          icon: const Icon(Icons.share),
          label: const Text('Share text'),
        ),
      ],
    );
  }
}
