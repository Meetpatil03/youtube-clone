import 'package:flutter/material.dart';

class SettingDialog extends StatefulWidget {
  final String identifier;
  final Function(String channelName)? onSave;

  const SettingDialog({super.key, required this.identifier, this.onSave});

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 0),
      title: Padding(padding: const EdgeInsets.only(left: 22,top: 8),
      child: Text(
        widget.identifier,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      ),

      content: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue,),
            )
          ),
          
        ),

        
      ),

      actions: [
        TextButton(
          onPressed: (){},
          child: const Text('Cancel',style: TextStyle(color: Colors.blue,),),
        ),

        TextButton(
          onPressed: (){},
          child: const Text('Save',style: TextStyle(color: Colors.black,),),
        )
      ],
    );
  }
}
