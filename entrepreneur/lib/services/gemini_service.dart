import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String apiKey;
  final String baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  GeminiService({required this.apiKey});

  Future<String> generateBusinessPitch({
    required String businessType,
    required String targetAudience,
    required String problemToSolve,
  }) async {
    final prompt = '''
    Generate a creative and convincing business pitch for a $businessType startup.
    Target audience: $targetAudience
    Problem to solve: $problemToSolve
    
    The pitch should include:
    1. A catchy name for the startup
    2. A one-sentence value proposition
    3. The problem being solved
    4. The proposed solution
    5. Why this solution is unique
    6. A brief go-to-market strategy
    
    Keep it concise, engaging, and persuasive, as if pitching to potential investors.
    ''';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'maxOutputTokens': 800,
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        throw Exception('Failed to generate pitch: ${response.body}');
      }
    } catch (e) {
      return 'Failed to generate pitch. Please try again later. Error: $e';
    }
  }

  Future<List<String>> generateBusinessChallenges({
    required String businessType,
    required int numberOfChallenges = 3,
  }) async {
    final prompt = '''
    Generate $numberOfChallenges realistic business challenges that a $businessType startup might face.
    Each challenge should be specific, realistic, and require strategic thinking to overcome.
    Format each challenge as a brief scenario with a clear problem to solve.
    ''';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.8,
            'maxOutputTokens': 800,
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['candidates'][0]['content']['parts'][0]['text'];
        
        // Split the text into separate challenges
        final challenges = text.split('\n\n')
            .where((s) => s.trim().isNotEmpty)
            .take(numberOfChallenges)
            .toList();
            
        return challenges;
      } else {
        throw Exception('Failed to generate challenges: ${response.body}');
      }
    } catch (e) {
      return ['Failed to generate challenges. Please try again later.'];
    }
  }
}

