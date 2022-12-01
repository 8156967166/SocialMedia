//
//  ContinueWithAppleViewController.swift
//  SocialMediaAppProject
//
//  Created by Bimal@AppStation on 06/09/22.
//

import AuthenticationServices
import UIKit

class ContinueWithAppleViewController: UIViewController {
   
    private let signInButton = ASAuthorizationAppleIDButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signInButton)
        // Do any additional setup after loading the view.
        signInButton.addTarget(self, action: #selector(didTapSigIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        signInButton.center = view.center
        
    }
    
    @objc func didTapSigIn() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

}


extension ContinueWithAppleViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Failed!..")
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let Credentials as ASAuthorizationAppleIDCredential:
            let firstName = Credentials.fullName?.givenName
            let lastName = Credentials.fullName?.familyName
            let email = Credentials.email
            break
        default:
            break
        }
    }
}

extension ContinueWithAppleViewController: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
}
