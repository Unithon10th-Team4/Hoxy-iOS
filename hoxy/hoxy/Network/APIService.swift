//
//  APIService.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    private func fetchRequest(url: String, onComplete: @escaping (Result<Data, Error>) -> Void) {
        
        guard let Url = URL(string: url) else {
            print("Error: invalid url")
            return
        }
        
        let task = URLSession(configuration: .default).dataTask(with: Url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                onComplete(.failure(error))
                return
            }
            
            guard let safeData = data else {
                guard let httpResponse = response as? HTTPURLResponse else { return }
                print("Error: no data")
                onComplete(.failure(NSError(domain: "no data", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            onComplete(.success(safeData))
            
        }
        task.resume()
    }
}

extension APIService {
    func fanclubRanking(onSuccess: @escaping (([FanclubRankingResponse]) -> Void), onError: ((Error) -> Void)? = nil) {
        let urlString = "\(baseUrl)fanclubs"
        print(urlString)
        self.fetchRequest(url: urlString) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode([FanclubRankingResponse].self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
}