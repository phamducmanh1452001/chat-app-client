import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xff1f232f),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF565E70),
                  ), 
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: (){}, 
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 20,),

        Container(
          width: 48,
          height: 48,
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xFF03A9F1),
          ),
        )
      ],
    );
  }
}