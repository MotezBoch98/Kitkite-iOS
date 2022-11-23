//
//  UserViewModel.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit.UIImage

public class UserViewModel: ObservableObject{
      var username: String = ""
      var firstname: String = ""
      var lastname: String = ""
      var email: String = ""
      var password: String = ""
//      var gender: String = ""
      var birthdate = Date()
    static var currentUser :User?
    static let sharedInstance = UserViewModel()
    
    func getAllUsers( completed: @escaping (Bool, [User]?) -> Void ) {
        AF.request(HOST_IP_URL + "user",
                   method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    var users : [User]? = []
                    for singleJsonItem in JSON(response.data!)["users"] {
                        users!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    }
                    completed(true, users)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }

    func signup(user: User) {
        AF.request(HOST_IP_URL + "user/register",
                   method: .post,
                   parameters: [
                    "username": user.username!,
                    "email": user.email!,
                    "password": user.password!,
                    "firstname": user.firstname!,
                    "lastname": user.lastname!,
                    "birthdate": DateUtils.formatFromDate(date: user.birthdate!)
//                    "gender": user.gender!
                   ] ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                case let .failure(error):
                    print(error)
                    
                }
            }
    }

    func login(email: String, password: String, completed: @escaping(User?)-> Void ) {
        AF.request(HOST_IP_URL + "user/login",
                   method: .post, parameters: ["email": email,"password": password] ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
                        .responseJSON {
                            (response) in
                            switch response.result {
                                
                            case .success(let JSON):
                                let response = JSON as! NSDictionary
                                let userResponse = response.object(forKey: "user") as! NSDictionary
                                let email = userResponse.object(forKey: "email") as? String ?? ""
                                let lastName = userResponse.object(forKey: "lastname") as? String ?? ""
                                let password = userResponse.object(forKey: "password") as? String ?? ""
                                let firstName = userResponse.object(forKey: "firstname") as? String ?? ""
                                let image = userResponse.object(forKey: "imageFilename") as? String ?? ""
                               
                                print("success  \(email )")
                                print("success  \(lastName )")
                                print("success  \(password )")
                                var currentUser = User(email: email, password: password, firstname: firstName, lastname: lastName)
                                
                                currentUser.imageFilename = image
                                Self.currentUser = currentUser
                              
                                print("success \(JSON )")
                               
                                completed(currentUser)
                            case .failure(let error):
                                print("request failed \(error)")
                                completed(nil)
                            }
                        }
              
                }


    func loginWithSocialApp(email: String, firstname: String, lastname: String, completed: @escaping (Bool, User?) -> Void ) {
        AF.request(HOST_IP_URL + "user/socialLogin",
                   method: .post,
                   parameters: [
                    "email": email,
                    "firstname": firstname,
                    "lastname": lastname
                   ],
                   encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    let user = self.makeItem(jsonItem: jsonData["user"])

                    print("this is the new token value : " + jsonData["token"].stringValue)
                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                    UserDefaults.standard.setValue(user._id, forKey: "UserId")
                    completed(true, user)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }

    func getUserWithToken(userToken: String, completed: @escaping (Bool, User?) -> Void ) {
        print("Looking for user --------------------")
        AF.request(HOST_IP_URL + "user/getUserWithToken",
                   method: .post,
                   parameters: ["token": userToken],
                   encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    let user = self.makeItem(jsonItem: jsonData["user"])
                    print("Found user --------------------")
                    print(user)
                    print("-------------------------------")
                    completed(true, user)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }


    func reSendConfirmationEmail(email: String, completed: @escaping (Bool) -> Void) {
        AF.request(HOST_IP_URL + "user/reSendConfirmationEmail",
                   method: .post,
                   parameters: ["email": email])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    completed(true)
                case let .failure(error):
                    print(error)
                    completed(false)
                }
            }
    }

    func forgotPassword(email: String, ReinitCode: String, completed: @escaping (Bool) -> Void) {
        AF.request(HOST_IP_URL + "user/forgotPassword",
                   method: .post,
                   parameters: ["email": email, "ReinitCode": ReinitCode])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    completed(true)
                case let .failure(error):
                    print(error)
                    completed(false)
                }
            }
    }

    func changePassword(email: String, newPassword: String, completed: @escaping (Bool) -> Void) {
        AF.request(HOST_IP_URL + "user/changePassword",
                   method: .put,
                   parameters: ["email": email,"new password": newPassword])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    completed(true)
                case let .failure(error):
                    print(error)
                    completed(false)
                }
            }
    }

    func changeProfilePicture(email: String, uiImage: UIImage, completed: @escaping (Bool) -> Void ) {

        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(uiImage.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "image.jpeg", mimeType: "image/jpeg")

            for (key, value) in
                    [
                        "email": email,
                    ]
            {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }

        },to: HOST_IP_URL + "user/profile-picture",
                  method: .post)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Success")
                    completed(true)
                case let .failure(error):
                    completed(false)
                    print(error)
                }
            }
    }



    func deleteUser(user: User) {

        AF.request(HOST_IP_URL + "user",
                   method: .delete,
                   parameters: ["_id": user._id!],
                   encoding: JSONEncoding.default,
                   headers: nil)
            .response { response in
                print(response)
            }
    }

    

    func makeItem(jsonItem: JSON) -> User {

        return User(
            _id: jsonItem["_id"].stringValue,
            username: jsonItem["username"].stringValue,
            email: jsonItem["email"].stringValue,
            password: jsonItem["password"].stringValue,
            firstname: jsonItem["firstname"].stringValue,
            lastname: jsonItem["lastname"].stringValue,
            birthdate: DateUtils.formatFromString(string: jsonItem["birthdate"].stringValue),
            imageFilename: jsonItem["imageFilename"].stringValue,
//            gender: jsonItem["gender"].stringValue,
            bio: jsonItem["bio"].stringValue,
            isVerified: jsonItem["isVerified"].boolValue
        )
    }
}
