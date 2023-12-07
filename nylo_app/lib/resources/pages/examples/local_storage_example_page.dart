import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import 'package:updown_app/app/controllers/local_storage_example_controller.dart';
import 'package:updown_app/resources/themes/styles/app_borders.dart';
import 'package:updown_app/resources/themes/styles/app_sizes.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LocalStorageExamplePage
    extends NyStatefulWidget<LocalStorageExampleController> {
  static const path = '/local-storage-example-page';

  LocalStorageExamplePage()
      : super(path, child: _LocalStorageExamplePagePageState());
}

class _LocalStorageExamplePagePageState
    extends NyState<LocalStorageExamplePage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Storage Example")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              container(
                child: Column(
                  children: [
                    Text('[]'),
                    ElevatedButton(
                      onPressed: () async {
                        await widget.controller.saveCollectionData([
                          // 113,43234,92344,12312
                        ]);
                        setState(() {});
                      },
                      child: Text('saveCollectionData'),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: NyFutureBuilder(
                  future: widget.controller.readCollection(),
                  child: (context, data) {
                    if (data == null || data.isEmpty) {
                      return container(
                        child: Column(
                          children: [
                            Text('A lista esta vazia'),
                            ElevatedButton(
                              onPressed: () async {
                                await widget.controller.addCollectionItem(1);
                                setState(() {});
                              },
                              child: Text('addCollectionItem'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: container(
                              child: Column(
                                children: [
                                  Text(data[index].toString()),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await widget.controller
                                          .addCollectionItem(data.length + 1);
                                      setState(() {});
                                    },
                                    child: Text('addCollectionItem'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await widget.controller
                                          .deleteCollectionItem(index);
                                      setState(() {});
                                    },
                                    child: Text('deleteCollectionItem'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Container container({required Widget child}) {
    return Container(
      padding: AppPaddings.contentDialog,
      decoration: BoxDecoration(
        borderRadius: AppBorders.medium,
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: child,
    );
  }
}
