//
//  APIService.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation
import CoreLocation

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
    
    private func fetchRequest(request: URLRequest, onComplete: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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

// MARK: Ranking Scene
extension APIService {
    
    /// 팬클럽 랭킹 조회
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
    
    /// 팬클럽 상세 조회
    func fanclubDetail(id: String,
                       onSuccess: @escaping ((FanclubDetailResponse) -> Void), onError: ((Error) -> Void)? = nil) {
        let urlString = "\(baseUrl)fanclubs/\(id)"
        print(urlString)
        self.fetchRequest(url: urlString) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode(FanclubDetailResponse.self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
}

// MARK: - Message Archive
extension APIService {
    func receivedMessage(onSuccess: @escaping (([MessageResponse]) -> Void), onError: ((Error) -> Void)? = nil) {
        let urlString = "\(baseUrl)messages?memberName=test" // TODO: -
        print(urlString)
        self.fetchRequest(url: urlString) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode([MessageResponse].self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
    
    func nearbyUser(onSuccess: @escaping (([NearUserResponse]) -> Void), onError: ((Error) -> Void)? = nil) {
        
        let url = "\(baseUrl)members/\(UserViewModel.shared.currentUser?.name ?? "test")/near"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let jsonBody = [
                            "latitude": 37.545492,
                            "longitude": 126.952641,
                            "distance": 5
                        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonBody, options: [])
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        self.fetchRequest(request: request) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode([NearUserResponse].self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
}

// MARK: - Home Scene
extension APIService {
    func currentUserData(onSuccess: @escaping ((User) -> Void), onError: ((Error) -> Void)? = nil) {
        let urlString = "\(baseUrl)members/test" // TODO: -
        self.fetchRequest(url: urlString) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode(User.self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
    
    func sendEmojiMessage(onSuccess: @escaping ((User) -> Void), onError: ((Error) -> Void)? = nil) {
        let urlString = "\(baseUrl)messages" // TODO: -
        self.fetchRequest(url: urlString) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode(User.self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
}
                
// MARK: MyProfileScene
extension APIService {
    func myProfile(onSuccess: @escaping ((UserProfileResponse) -> Void), onError: ((Error?) -> Void)? = nil) {
        
        let username = UserViewModel.shared.currentUser?.name ?? "test"
        let urlString = "\(baseUrl)members/\(username)"
        print(urlString)
        
        self.fetchRequest(url: urlString) { result in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode(UserProfileResponse.self, from: data)
                onSuccess(response)
            case .failure(let error):
                onError?(error)
            }
        }
    }
}
