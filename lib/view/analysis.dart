import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rozi_design/view/detail_page.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  final double expanded_height = 150;
  final double rounded_container_height = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(child: BuildCard())
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expanded_height,
        rounded_container_height,
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double rounded_container_height;

  DetailSliverDelegate(this.expandedHeight, this.rounded_container_height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag:
                "https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
            child: Image.network(
              "https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: expandedHeight - rounded_container_height - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: rounded_container_height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 100 - shrinkOffset,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Your Video",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class BuildCard extends StatefulWidget {
  BuildCard({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                  ),
                )),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                    color: Colors.amber),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.workspace_premium),
                    Icon(Icons.chat),
                    Icon(Icons.mail),
                  ],
                )),
              ),
            ),
          ),
          const Positioned(
              top: 25,
              left: 20,
              child: Text(
                "14 Febraury 2023",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )),
          Positioned(
              top: 100,
              left: 20,
              child: Row(
                children: [
                  FloatingActionButton(
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage()))),
                  SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Play",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
