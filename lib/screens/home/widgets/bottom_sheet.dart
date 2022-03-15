import 'package:flutter/material.dart';

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  child: const Text('A'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: const Text('A'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  child: const Text('A'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  child: const Text('A'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: const Text('A'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  child: const Text('A'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
