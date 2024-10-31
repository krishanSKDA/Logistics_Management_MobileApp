import 'package:flutter/material.dart';
import 'package:mobile_app/screen/Search_Screen/components/search_form.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Sample previous search data (this could be fetched from local storage or an API)
  final List<String> previousSearches = [
    'Shipment ID: 12345',
    'Delivery to: New York',
    'Package: Electronics',
    'Shipment ID: 98765',
    'Delivery to: Los Angeles',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Dismiss keyboard if tapping outside
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Form
              SearchForm(
                onChanged: (value) {
                  // Add search logic here
                },
                onFieldSubmitted: (value) {
                  // Add search submit logic here
                },
                onTabFilter: () {
                  // Add filter logic here
                },
              ),
              const SizedBox(height: 20),

              // Displaying previous searches as a demo
              Text(
                'Previous Searches',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),

              // List of previous searches
              Expanded(
                child: ListView.builder(
                  itemCount: previousSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.history,
                          color: Theme.of(context).primaryColor),
                      title: Text(previousSearches[index]),
                      onTap: () {
                        // Handle the tap on previous searches
                        // For example, pre-fill the search form with this data
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
