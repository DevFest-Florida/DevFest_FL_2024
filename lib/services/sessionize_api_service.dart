import 'dart:convert';
import 'package:devfestfl/home/speaker.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devfestfl/home/group.dart';

class SessionizeApiService {
  static const String _baseUrl = 'https://sessionize.com/api/v2/1xy9p1oq/view/';
  static const String _allDataEndpoint = 'All';
  static const String _speakersEndpoint = 'Speakers';
  static const String _sessionsEndpoint = 'Sessions';

  final Logger _logger = Logger('SessionizeApiService');

// not being used currently
  Future<List<dynamic>> fetchAllData() async {
    final response = await http.get(Uri.parse('$_baseUrl$_allDataEndpoint'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final groups = data.map((json) => Group.fromJson(json)).toList();
      await _cacheData(_allDataEndpoint, data);
      return groups;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Speaker>> fetchSpeakers() async {
    final response = await http.get(Uri.parse('$_baseUrl$_speakersEndpoint'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final speakers = data.map((json) => Speaker.fromJson(json)).toList();
      _logger.info('Fetched speakers: $data');
      await _cacheData(_speakersEndpoint, data);
      return speakers;
    } else {
      _logger.severe(
          'Failed to load speakers: ${response.statusCode} ${response.body}');
      throw Exception('Failed to load speakers');
    }
  }

  Future<List<Group>> fetchSessions() async {
    final response = await http.get(Uri.parse('$_baseUrl$_sessionsEndpoint'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final sessions = data.map((json) => Group.fromJson(json)).toList();
      await _cacheData(_sessionsEndpoint, data);
      return sessions;
    } else {
      _logger.severe(
          'Failed to load sessions: ${response.statusCode} ${response.body}');
      throw Exception('Failed to load sessions');
    }
  }

  Future<void> _cacheData(String key, dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(data));
    _logger.info('Cached data for key: $key'); // Log successful caching
  }

  Future<dynamic> _getCachedData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(key);
    if (cachedData != null) {
      _logger.info('Retrieved cached data for key: $key');
      _logger.warning('No cached data found for key: $key');
      return json.decode(cachedData);
    }
    return null;
  }

  Future<List<dynamic>> getAllData() async {
    if (await _isOnline()) {
      return await fetchAllData();
    } else {
      final cachedData = await _getCachedData(_allDataEndpoint);
      if (cachedData != null) {
        return (cachedData as List)
            .map((json) => Group.fromJson(json))
            .toList();
      } else {
        // Handle the case where there is no cached data
        _logger.severe('No cached data found for getAllData'); // Log the error
        throw Exception(
            'No internet connection and no cached data available for getAllData.');
      }
    }
  }

  Future<List<Speaker>> getSpeakers() async {
    if (await _isOnline()) {
      return await fetchSpeakers();
    } else {
      final cachedData = await _getCachedData(_speakersEndpoint);
      if (cachedData != null) {
        return (cachedData as List)
            .map((json) => Speaker.fromJson(json))
            .toList();
      } else {
        // Handle the case where there is no cached data
        _logger.severe('No cached data found for getSpeakers'); // Log the error
        throw Exception(
            'No internet connection and no cached data available for getSpeakers.');
      }
    }
  }

  Future<List<Group>> getSessions() async {
    if (await _isOnline()) {
      return await fetchSessions();
    } else {
      final cachedData = await _getCachedData(_sessionsEndpoint);
      if (cachedData != null) {
        return (cachedData as List)
            .map((json) => Group.fromJson(json))
            .toList();
      } else {
        // Handle the case where there is no cached data
        _logger.severe('No cached data found for getSessions'); // Log the error
        throw Exception(
            'No internet connection and no cached data available for getSessions.');
      }
    }
  }

  // Helper function to check for internet connectivity
  Future<bool> _isOnline() async {
    return await InternetConnection().hasInternetAccess;
  }
}
