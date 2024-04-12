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
    
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "F11A11C0-B640-8E0B-3743-78F105481E72",
        "Accept": "application/json"
    ]
    
    func printAssets(completion: @escaping ([ExhangeRates]) -> Void) {
        AF.request(NetworkManager.Links.coinApiLink + EndPoints.assets, headers: header).responseDecodable(of: [ExhangeRates].self) { response in
            switch response.result {
            case .success(let rates): completion(rates)
            case .failure(let failure): print(failure)
            }
        }
    }
}
