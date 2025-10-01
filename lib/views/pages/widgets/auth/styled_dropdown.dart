import 'package:flutter/material.dart';

class StyledDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
  final String label;

  const StyledDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              color: Color(0xFF2C3E50),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: SizedBox(),
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Color(0xFF2C3E50),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}