import 'package:flutter/material.dart';
import 'package:im_web/constants.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Text("Add Items"),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.black26,
          ),
          Container(
            height: 470,
            child: ListView(
              shrinkWrap: true,
              children: [
                ItemsTable()
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.black26,
          ),
          Padding(padding: EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                  onPressed: ()=>Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding
                    ),
                    minimumSize: Size(180,40),
                    textStyle: Theme.of(context).textTheme.caption,
                  ),
                  child: Text("Cancel")
              ),
              SizedBox(width: defaultPadding,),
              ElevatedButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding
                    ),
                    minimumSize: Size(180,40),
                    textStyle: Theme.of(context).textTheme.caption,
                    backgroundColor: primaryColor,
                  ),
                  child: Text("Done",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),)
              )
            ],
          ),)
        ],
      ),
    );
  }
}

class ItemsTable extends StatefulWidget {
  const ItemsTable({Key? key}) : super(key: key);

  @override
  _ItemsTableState createState() => _ItemsTableState();
}

class _ItemsTableState extends State<ItemsTable> {
  List<int> selectedItems = [];
  List<int> quantities = List.generate(partiesData.length, (index) => 1 );
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
                showCheckboxColumn: true,
                checkboxHorizontalMargin: 30,
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                      label: Text("ITEM NAME")
                  ),
                  DataColumn(
                      label: Text("ITEM CODE")
                  ),
                  DataColumn(
                      label: Text("STOCK QTY")
                  ),
                  DataColumn(
                      label: Text("STOCK VALUE")
                  ),
                  DataColumn(
                      label: Text("SELLING PRICE")
                  ),
                  DataColumn(
                      label: Text("PURCHASE PRICE")
                  ),
                  DataColumn(
                      label: Text("MRP")
                  ),
                  DataColumn(
                      label: Text("WHOLESALE PRICE")
                  ),
                  DataColumn(
                      label: Text("QUANTITY")
                  ),
                ],
                rows: List.generate(partiesData.length, (index) =>
                    DataRow(
                        onSelectChanged: (bool? selected){
                          setState(() {
                            if(selected!){
                              selectedItems.add(index);
                            }else{
                              selectedItems.remove(index);
                            }
                          });
                        },
                        selected: selectedItems.contains(index),
                        cells: [
                          DataCell(
                              Text(partiesData[index].name)
                          ),
                          DataCell(
                              Text(partiesData[index].code)
                          ),
                          DataCell(
                              Text(partiesData[index].qty)
                          ),
                          DataCell(
                              Text(partiesData[index].value)
                          ),
                          DataCell(
                              Text(partiesData[index].sellingPrice)
                          ),
                          DataCell(
                              Text(partiesData[index].purchasePrice)
                          ),
                          DataCell(
                              Text(partiesData[index].mrp)
                          ),
                          DataCell(
                              Text(partiesData[index].wholeSalePrice)
                          ),
                          DataCell(
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    setState(() {

                                      quantities[index]>1?
                                      quantities[index]=quantities[index]-1:quantities[index];

                                    });
                                  }, icon: Icon(Icons.remove)),
                                  Text("${quantities[index]}"),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      quantities[index]=quantities[index]+1;
                                    });
                                  }, icon: Icon(Icons.add)),
                                ],
                              )
                          )
                        ]
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}

class ItemsData{
  final String name,code,qty,value,sellingPrice,purchasePrice,mrp,wholeSalePrice;

  ItemsData({required this.name,required this.code,required this.qty,required this.value,required this.sellingPrice,required this.purchasePrice,required this.wholeSalePrice,required this.mrp});
}

List<ItemsData> partiesData = [
  ItemsData(name: "Daal", code: "330", qty: "10 PCS", value: "20,000",sellingPrice: "300",purchasePrice: "200",wholeSalePrice: "100",mrp: "40"),
  ItemsData(name: "Rice", code: "229", qty: "50 PCS", value: "11,000",sellingPrice: "500",purchasePrice: "400",wholeSalePrice: "200",mrp: "30"),
  ItemsData(name: "Flour", code: "112", qty: "10 KG", value: "19,000",sellingPrice: "800",purchasePrice: "600",wholeSalePrice: "200",mrp: "220"),
];



