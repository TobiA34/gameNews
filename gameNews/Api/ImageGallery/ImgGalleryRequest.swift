import Foundation
import Alamofire

class ImgGalleryRequest{
    func getImgGallery(completion: @escaping (Swift.Result<Array<ImgGalleryItem>, Error>) -> ()) {
    Alamofire.request("http://www.gamespot.com/api/image_galleries/?api_key=1f4d669acd0602575bbe10c894a2b0ae91215a27&format=json").response { response in
            do {
                guard let data = response.data else { return }
                
                let decoder =  JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
 
                 let imgGalleryResult = try decoder.decode(ImgGalleryResults.self, from: data)
                
                completion(.success(imgGalleryResult.results ?? []))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
    }
}
