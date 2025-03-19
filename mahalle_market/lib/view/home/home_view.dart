import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'dart:math' as math;
import 'package:mahalle_market/view/main_tabview/main_tabview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isLoading = true;
  final List<Map<String, dynamic>> _markets = [
    {
      'name': 'Migros Market',
      'address': 'Atatürk Cad. No:123',
      'distance': '0.8 km',
      'rating': 4.7,
      'image': 'https://via.placeholder.com/100',
    },
    {
      'name': 'A101 Market',
      'address': 'İstiklal Cad. No:45',
      'distance': '1.2 km',
      'rating': 4.3,
      'image': 'https://via.placeholder.com/100',
    },
    {
      'name': 'BİM Market',
      'address': 'Cumhuriyet Cad. No:78',
      'distance': '0.5 km',
      'rating': 4.5,
      'image': 'https://via.placeholder.com/100',
    },
    {
      'name': 'Şok Market',
      'address': 'Millet Cad. No:36',
      'distance': '1.5 km',
      'rating': 4.2,
      'image': 'https://via.placeholder.com/100',
    },
  ];

  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Meyve & Sebze',
      'icon': Icons.apple,
    },
    {
      'name': 'İçecekler',
      'icon': Icons.local_drink,
    },
    {
      'name': 'Fırın',
      'icon': Icons.breakfast_dining,
    },
    {
      'name': 'Atıştırmalık',
      'icon': Icons.fastfood,
    },
    {
      'name': 'Temel Gıda',
      'icon': Icons.kitchen,
    },
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Address Selection Bar
          _buildAddressBar(),

          // Main Content
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: TColor.primary,
                    ),
                  )
                : _buildMainContent(),
          ),
        ],
      ),
    );
  }

  // Address Selection Bar
  Widget _buildAddressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: TColor.primary, size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ev Adresim',
                  style: TextStyle(
                    fontSize: 14,
                    color: TColor.placeholder,
                  ),
                ),
                Text(
                  'İstanbul, Kadıköy, Caferağa Mah.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: TColor.SecondaryText,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: TColor.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                // Navigate to address selection
              },
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Değiştir',
                style: TextStyle(
                  color: TColor.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Main Content (Categories and Markets)
  Widget _buildMainContent() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Search Bar
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Market veya ürün ara...',
              hintStyle: TextStyle(color: TColor.placeholder),
              prefixIcon: Icon(Icons.search, color: TColor.placeholder),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
            style: TextStyle(color: TColor.SecondaryText),
          ),
        ),

        const SizedBox(height: 20),

        // Categories Section
        Text(
          'Kategoriler',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: TColor.SecondaryText,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryItem(
                _categories[index]['name'],
                _categories[index]['icon'],
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // Popular Markets Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popüler Marketler',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TColor.SecondaryText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Tümünü Gör',
                style: TextStyle(
                  color: TColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _markets.length,
          itemBuilder: (context, index) {
            return _buildMarketItem(_markets[index]);
          },
        ),
      ],
    );
  }

  // Category Item
  Widget _buildCategoryItem(String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: TColor.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30,
              color: TColor.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: TColor.SecondaryText,
            ),
          ),
        ],
      ),
    );
  }

  // Market Item
  Widget _buildMarketItem(Map<String, dynamic> market) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigate to market detail
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Market Image
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TColor.primary.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.store,
                      color: TColor.primary,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Market Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        market['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: TColor.SecondaryText,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        market['address'],
                        style: TextStyle(
                          fontSize: 12,
                          color: TColor.placeholder,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: TColor.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            market['distance'],
                            style: TextStyle(
                              fontSize: 12,
                              color: TColor.placeholder,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            market['rating'].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: TColor.placeholder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Arrow
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: TColor.placeholder,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
