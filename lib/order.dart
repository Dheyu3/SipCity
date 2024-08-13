import 'package:flutter/material.dart';

class order extends StatefulWidget {
  const order({super.key, required this.cimage, required this.cname});

  final String cimage;
  final String cname;


  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(30)
                ),
                  boxShadow: [
                    BoxShadow(spreadRadius: 7,
                    blurRadius: 7,
                    offset: Offset(0, 5)
                    ),
                  ]
                ),
                child: Hero(
                  tag: widget.cimage,
                  child: Image.asset(widget.cimage,fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text(widget.cname,style: TextStyle(fontSize: 50 ,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Icon(Icons.coffee,size: 45,),SizedBox(width: 44,),
                  Icon(Icons.coffee,size: 50,),SizedBox(width: 44,),
                  Icon(Icons.coffee,size: 59,),SizedBox(width: 50,),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text('Quantity',style: TextStyle(fontSize: 30),),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.greenAccent),
                      child: Row(
                        children: [
                          Icon(Icons.add,size: 30,),
                          SizedBox(width: 20,),
                          Text("1",style: TextStyle(fontSize: 30),),
                          SizedBox(width: 20,),
                          Icon(Icons.exposure_minus_1,size: 30,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )

          ],
        ),
    );
  }
}
