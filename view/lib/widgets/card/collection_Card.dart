import 'package:flutter/material.dart';
import 'package:view/constants/text_style.dart';
import 'package:view/constants/route.dart';
import 'package:view/services/CollectionList_svs.dart';
<<<<<<< HEAD
import 'package:view/pages/collectionlist_View.dart';
=======
import 'package:quickalert/quickalert.dart';
>>>>>>> 184e807e7d69166dd1f4e7c7b43510493c22e55b

class CollectionListCard extends StatelessWidget {
  final Map<String, dynamic> contextData;
  final VoidCallback onUpdateCollectionList;

  CollectionListCard({
    required this.contextData,
    required this.onUpdateCollectionList,
  });

<<<<<<< HEAD
  void removeCollectionList(BuildContext context, String cl_id) async {
    CollectionList_SVS service = CollectionList_SVS(CL: []);
    await service.removeCL(cl_id);
    // 顯示刪除成功的通知
=======
  void _removeCollectionList(BuildContext context, String clId) async {
    CollectionList_SVS service = CollectionList_SVS(CL: []);
    await service.removeCL(clId);

>>>>>>> 184e807e7d69166dd1f4e7c7b43510493c22e55b
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('刪除成功'),
        duration: Duration(seconds: 2),
      ),
    );
<<<<<<< HEAD
    getCard(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => CollectionListView()),
          (Route<dynamic> route) => false,
    );
=======

    onUpdateCollectionList();
>>>>>>> 184e807e7d69166dd1f4e7c7b43510493c22e55b
  }

  void _handleDeleteConfirm(BuildContext context) async {
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      confirmBtnText: '確認刪除',
      title: '確定要刪除此收藏清單?',
      confirmBtnColor: Colors.green,
      cancelBtnText: '取消',
      text: '請確定是否要刪除此收藏清單?',
      onConfirmBtnTap: () async {
        try {
          Navigator.pop(context);  // Close the confirmation dialog

          _removeCollectionList(context, contextData['id']);

          // Short delay before showing success message
          await Future.delayed(const Duration(milliseconds: 300));

          await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: "已刪除收藏清單!",
          );
        } catch (e) {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "處理過程中出錯了",
          );
        }
      },
      onCancelBtnTap: () {
        Navigator.pop(context);  // Close the confirmation dialog if canceled
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromRGBO(232, 248, 234, 1),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40.0)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                Routes.collectView,
                arguments: contextData,
              );
              if (result == true) {
                onUpdateCollectionList();
              }
            },

            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.elderly,
                      size: 32,
                      color: Color.fromRGBO(56, 107, 79, 1),
                    ),
                  ),
<<<<<<< HEAD
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.black),
                    onPressed: () {
                      removeCollectionList(context,this.context['id']);
                    },
=======
                  Expanded(
                    child: Center(
                      child: Text(
                        contextData['name'],
                        style: TextStyle(color: Color.fromRGBO(56, 107, 79, 1), fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 3),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black, size: 28),
                      onPressed: () => _handleDeleteConfirm(context),
                    ),
>>>>>>> 184e807e7d69166dd1f4e7c7b43510493c22e55b
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: Color.fromRGBO(56, 107, 79, 1),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: contextData['collection'].length > 3 ? 3 : contextData['collection'].length,
            itemBuilder: (context, index) {
              List<String> items = List<String>.from(contextData['collection']);
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(233, 245, 239, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Text(
                            items[index],
                            style: UI_TextStyle.Collection_TextStyle,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
