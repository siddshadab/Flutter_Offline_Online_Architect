import 'dart:io';
import 'package:eco_los/db/AppDatabase.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'DocumentCollectorBean.dart';
import 'package:eco_los/helpers/globals.dart' as globals;


class ViewDocuments extends StatefulWidget {
  final List<DocumentCollectorBean> documentCollectorBeanList;
  ViewDocuments(this.documentCollectorBeanList);


  @override
  _ViewDocuments createState() =>
      _ViewDocuments();
}

class _ViewDocuments
    extends State<ViewDocuments> {
  List<DocumentCollectorBean> documentCollectorBeanList = new List<
      DocumentCollectorBean>();
  List<DataRow> _sampleDataRows = new List<DataRow>();
  List<DataColumn> _dataColumns = new List<DataColumn>();
  List<int> selectedIndex = new List<int>();
  final dateFormat = DateFormat("yyyy/MM/dd hh:mm:ss");
  PhotoViewGallery DocList = null;

  // double shadowbalance=double.parse(widget.documentCollectorBeanList[0].mtotallienfcy)+double.parse(widget.documentCollectorBeanList[0].macttotballcy);
  var rows2;
  var cols2;

  @override
  void initState() {
    setDocuments();
    super.initState();
    List columnName = [
      /*"SrNo",*/
      "Amount",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
    ];
    //  print("documentCollectorBeanList"+widget.documentCollectorBeanList.toString());


    if (widget.documentCollectorBeanList != null) {
      documentCollectorBeanList = widget.documentCollectorBeanList;
    }
    getRow();
    cols2 = [
      /* new DataColumn(
        label: const Text('SrNo'),

      ),*/
      new DataColumn(
        label: const Text('SrNo'),
      ),
      new DataColumn(
        label: const Text('Customer Type'),

      ),
      new DataColumn(
        label: const Text('Customer Name'),

      ),
      new DataColumn(
        label: const Text('Document Type'),
      ),
      new DataColumn(
        label: const Text('Document Number'),
      ),
      new DataColumn(
        label: const Text('Issue Date'),
      ),
      new DataColumn(
        label: const Text('Expiry Date'),
      ), new DataColumn(
        label: const Text('Delete'),
      )
    ];
  }

  void getRow() {
    rows2 = new List.generate(
        documentCollectorBeanList.length,
            (int a) =>
        new DataRow(

            cells: [
              new DataCell(
                  new Text((a + 1).toString())),
              new DataCell(
                  new Text(documentCollectorBeanList[a].mcustomertype == null ||
                      documentCollectorBeanList[a].mcustomertype.toString() ==
                          "null" ? "" :
                  (documentCollectorBeanList[a].mcustomertype == "102"
                      ? "Co-APPLICANT"
                      : documentCollectorBeanList[a].mcustomertype == "103"
                      ? "GUARANTOR"
                      : documentCollectorBeanList[a].mcustomertype == "105"
                      ? "SPOUSE"
                      : documentCollectorBeanList[a].mcustomertype == "106"
                      ? "CO-GUARANTOR"
                      : "Applicant")
                  )),
              new DataCell(
                  new Text(documentCollectorBeanList[a].mcustname == null ||
                      documentCollectorBeanList[a].mcustname.toString() ==
                          "null" ? "" :
                  documentCollectorBeanList[a].mcustname.toString()
                  )),
              new DataCell(
                  new Text(documentCollectorBeanList[a].mimgtypedesc == null ||
                      documentCollectorBeanList[a].mimgtypedesc.toString() ==
                          "null" ? "" :
                  documentCollectorBeanList[a].mimgtypedesc.toString()
                  )),
              new DataCell(
                  new Text(documentCollectorBeanList[a].mdoctno == null ||
                      documentCollectorBeanList[a].mdoctno.toString() == "null"
                      ? ""
                      :
                  documentCollectorBeanList[a].mdoctno.toString()
                  )),

              new DataCell(
                  new Text(documentCollectorBeanList[a].missuedate == null ||
                      documentCollectorBeanList[a].missuedate.toString() ==
                          "null" ? "" :
                  documentCollectorBeanList[a].missuedate.toString().substring(
                      0, 10)
                  )),
              new DataCell(
                  new Text(documentCollectorBeanList[a].mexpdate == null ||
                      documentCollectorBeanList[a].mexpdate.toString() == "null"
                      ? ""
                      :
                  documentCollectorBeanList[a].mexpdate.toString().substring(
                      0, 10)
                  )),
              new DataCell(
                InkWell(
                  child: Icon(Icons.delete_forever,
                    color: Colors.red,
                    size: 30.0,),
                  onTap: () {
                    _deleteIt(documentCollectorBeanList[a], a);
                  },
                ),)
            ]));
  }

  @override
  Widget build(BuildContext context) {
    //  MaterialApp(
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            Container(
              height: 400.0, width: 200.0,
              child: DocList != null ? DocList : Container(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                rows: rows2,
                columns: cols2,
                columnSpacing: 1.0,
                horizontalMargin: 1.0,
              ),
            )
          ]
      ),
    );
  }

  setDocuments() async {
    var DocListView = new List<PhotoViewGalleryPageOptions>();
    for (int docCount = 0; docCount < widget.documentCollectorBeanList.length;
    docCount++) {
      print("widget.documentCollectorBeanList[docCount].mimgtypedesc" +
          widget.documentCollectorBeanList[docCount].mimgtypedesc.toString());
      DocListView.add(PhotoViewGalleryPageOptions(
        imageProvider: FileImage(
          File(widget.documentCollectorBeanList[docCount].imgstring),
        ),
      )
      );
    }
    DocList = PhotoViewGallery(pageOptions: DocListView);
    setState(() {});
  }

  void _deleteIt(documentCollectorBeanList, int a) async {
    await Navigator.of(context).pop();
  }


}





