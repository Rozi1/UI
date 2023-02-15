import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rozi_design/view/sub_detail.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue[900]),
        child: Center(
          child: ListTile(
            leading: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.pause,
                size: 30,
                color: Colors.white,
              ),
            ),
            title: Text(
              ".25x",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
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

  Widget _buildDetail() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildCad(context: context), _buildCad(context: context)],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildCad(context: context), _buildCad(context: context)],
        )
      ],
    );
  }
}

class _buildCad extends StatelessWidget {
  const _buildCad({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
            color: Colors.grey[100]),
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Text 1",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.generating_tokens,
                    size: 50,
                  ),
                  Text(
                    "Text 2",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SubDetailPage())),
              child: Container(
                width: double.infinity,
                height: 29,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: Colors.grey[200]),
                child: const Center(
                  child: Text(
                    "View detail",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double rounded_container_height;

  DetailSliverDelegate(this.expandedHeight, this.rounded_container_height);
  late TabController _tabController;

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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: 70,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
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
