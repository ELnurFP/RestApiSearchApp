import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import '../services/users_services.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? query;
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<Data>(context, listen: false);
    postModel.getPost();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<Data>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'Search Users Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal))),
              onChanged: (String value) {
                print(value);
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(
              child: postModel.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: postModel.post!.data!.length,
                      itemBuilder: (context, index) {
                        return query == null || query == ""
                            ? ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        postModel.post!.data![index].avatar!)),
                                title: Text(
                                    postModel.post!.data![index].firstName! +
                                        " " +
                                        postModel.post!.data![index].lastName!),
                                subtitle:
                                    Text(postModel.post!.data![index].email!),
                              )
                            : postModel.post!.data![index].firstName!
                                    .startsWith(query!.toUpperCase() +
                                        query!.substring(1).toLowerCase())
                                ? ListTile(
                                    leading: CircleAvatar(
                                        backgroundImage: NetworkImage(postModel
                                            .post!.data![index].avatar!)),
                                    title: Text(postModel
                                            .post!.data![index].firstName! +
                                        " " +
                                        postModel.post!.data![index].lastName!),
                                    subtitle: Text(
                                        postModel.post!.data![index].email!),
                                  )
                                : SizedBox();
                      }))
        ],
      ),
    );
  }
}
