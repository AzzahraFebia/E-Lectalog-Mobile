import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = "https://e-lectalog-production.up.railway.app/api";

  // Mengambil daftar produk dari backend
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      
      List jsonResponse;
      if (decodedData is List) {
        jsonResponse = decodedData;
      } else if (decodedData is Map && decodedData.containsKey('data')) {
        jsonResponse = decodedData['data'];
      } else if (decodedData is Map && decodedData.containsKey('products')) {
        jsonResponse = decodedData['products'];
      } else {
        jsonResponse = [];
      }

      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Gagal memuat produk dari server');
    }
  }

  // Fungsi Login ke Backend Laravel
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Gagal melakukan login');
    }
  }
}