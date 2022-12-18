import 'package:flutter/material.dart';
import 'package:sciencenotes/domain/messages.dart';

class ListMessages extends StatefulWidget {
  final Messages msg;
  const ListMessages({
    Key? key,
    required this.msg,
  }) : super(key: key);

  @override
  State<ListMessages> createState() => _ListMessagesState();
}
bool side=true;
int x=0;

class _ListMessagesState extends State<ListMessages> {
  Widget build(BuildContext context) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String datetime = tsdate.day.toString() + "/" + tsdate.month.toString() + "/" + tsdate.year.toString();
    sideMessage();
    return Column(
      crossAxisAlignment: side ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
            mainAxisAlignment: side ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: side ? const EdgeInsets.only(right: 10) : const EdgeInsets.only(left: 10),
                width: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 247, 243),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.msg.message,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Abel-Regular'),
                    ),
                  ],
                ),
              ),
            ]),
        const SizedBox(height: 10),
        Text(
          datetime,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Abel-Regular'),
        ),
      ],
    );
  }

  sideMessage(){
    x++;
    if((x%2) == 0){
      side = true;
    }else{
      side = false;
    }
  }

}