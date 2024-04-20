import Alamofire
import Foundation

final class NetworkManager {
    static let instance = NetworkManager()
    
    private init() {}
    
    enum Links {
        static let coinApiLink = "https://rest.coinapi.io/v1"
    }
    
    enum EndPoints {
        static let assets = "/assets"
    }
    
    private let header: HTTPHeaders = [
        "X-CoinAPI-Key": "D70F6A5C-38BC-4311-8841-CE404672CC74"
    ]
    
    func getAssets(completion: @escaping ([ExhangeRates]) -> Void) {
        AF.request(NetworkManager.Links.coinApiLink + EndPoints.assets, headers: header)
            .validate(statusCode: 200 ..< 300)
            .responseDecodable(of: [ExhangeRates].self) { response in
                switch response.result {
                case .success(let rates): completion(rates)
                case .failure(let failure): print(failure)
                }
            }
    }
}
