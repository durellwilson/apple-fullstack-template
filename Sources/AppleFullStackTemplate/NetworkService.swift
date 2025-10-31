import Foundation

actor NetworkService {
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func post<T: Encodable, R: Decodable>(_ data: T, to url: URL) async throws -> R {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(data)
        
        let (responseData, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(R.self, from: responseData)
    }
}
