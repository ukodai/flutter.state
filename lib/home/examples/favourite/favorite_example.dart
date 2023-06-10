import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "favorite_provider.dart";

class FavoriteExample extends StatelessWidget {
  const FavoriteExample({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building UI: Favorite Example");
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Example"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Consumer<FavoriteProvider>(
              builder: (context, value, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favoriteProvider.getList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => favoriteProvider.cList(
                      favoriteProvider.getList[index],
                    ),
                    child: Chip(
                      label: Text(
                        favoriteProvider.getList[index].toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Consumer<FavoriteProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => favoriteProvider.cList(index),
                    title: Text(index.toString()),
                    trailing: Icon(
                      favoriteProvider.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
