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
    @IBOutlet weak var submitOutlet: UIButton!
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        usernameOutlet.rx.text.orEmpty.asObservable()
            .subscribe(onNext: { src in
                self.viewModel.inputs.username(val: src)
            })
            .disposed(by: disposeBag)
        
        passwordOutlet.rx.text.orEmpty.asObservable()
            .subscribe{ src in
                self.viewModel.inputs.password(src: src.element ?? "")
            }
            .disposed(by: disposeBag)
        viewModel.outputs.canLogin.asObservable().subscribe(onNext: { self.submitOutlet.isEnabled = $0 }).disposed(by: disposeBag)

    }


    @IBAction func loginHandle() {
        viewModel.inputs.submit()
    }

    @IBAction func login() {
    }

}
