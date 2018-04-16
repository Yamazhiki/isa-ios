//
// Created by Yamazhiki on 13/03/2018.
// Copyright (c) 2018 斌王. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Prelude

class LoginViewController: RxViewController {
    let viewModel: LoginViewModelType = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func loginHandle() {
    }

    @IBAction func login() {
    }

}
