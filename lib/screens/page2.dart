import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<Data>(context, listen: false);
    postModel.getPost();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<Data>(context);
    return Container(
        padding: const EdgeInsets.all(20),
        child: postModel.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: postModel.post!.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          postModel.post!.data![index].firstName! +
                              " " +
                              postModel.post!.data![index].lastName!,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Image.network(
                          postModel.post!.data![index].avatar!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }));
  }
}
