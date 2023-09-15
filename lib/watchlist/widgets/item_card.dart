import 'package:flutter/material.dart';
import 'package:routes/watchlist/modal/watchlist_modal.dart';

Widget itemCard(WatchlistModal item) => Container(
      padding: const EdgeInsets.all(3),
      height: 90,
      child: Card(
        elevation: 1,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 57, 90, 105)),
                  ),
                  Text(
                    item.contacts!,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                  child: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),
    );
