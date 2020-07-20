//
//  JSONRequest.swift
//  TestTask
//
//  Created by Илья Миронов on 16.07.2020.
//  Copyright © 2020 Ilya Mironov. All rights reserved.
//

import Foundation

func receiveJSONData(from url: URL, completion: @escaping (JSONData) -> () ){
    let session = URLSession.shared
    //var jsonData: JSONData?
    session.dataTask(with: url) { data, response, error in
        
        guard let data = data else {
            print("Error: no data received.")
            return
        }
        
        do {
            let parsedData = try JSONDecoder().decode(JSONData.self, from: data)
            //jsonData = parsedData
            completion(parsedData)
        } catch let error {
            print("Parsing error: \(error)")
        }
    }.resume()
}

