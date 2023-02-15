import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubDetailPage extends StatefulWidget {
  const SubDetailPage({super.key});

  @override
  _SubDetailPageState createState() => _SubDetailPageState();
}

class _SubDetailPageState extends State<SubDetailPage> {
  final double expanded_height = 300;
  final double rounded_container_height = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 20),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )))
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

Widget _buildDetail() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Foot Landing",
          style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.ac_unit_rounded,
                size: 80,
              ),
              Text(
                "Flat Foot Landing",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 20,),
        Text(
          "Explanation",
          style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Description of the title. Description of the title. Description of the title. Description of the title. Description of the title. Description of the title. Description of the title. Description of the title. Description of the title. ",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Strenghtening exercised",
          style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Congrats ! No exercises are necessary",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    ),
  );
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
