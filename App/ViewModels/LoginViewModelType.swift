//
// Created by Yamazhiki on 13/03/2018.
// Copyright (c) 2018 斌王. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

internal protocol LoginViewModelInputs {
    func username(val: String)
    func password(src: String)
    func submit()
}

internal protocol LoginViewModelOutputs {
    var loginResult: Observable<Int> { get }
    var canLogin: Driver<Bool> { get }
}

internal protocol LoginViewModelType {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

internal struct LoginViewModel: LoginViewModelInputs, LoginViewModelOutputs, LoginViewModelType {
    private let usernameSubject = PublishSubject<String>()
    private let passwordSubject = PublishSubject<String>()
    private let submitClickSubject = PublishSubject<Void>()

    var inputs: LoginViewModelInputs {
        return self
    }
    var outputs: LoginViewModelOutputs {
        return self
    }


    func username(val: String) {
        usernameSubject.onNext(val)
    }

    func password(src: String) {
        passwordSubject.onNext(src)
    }

    func submit() {
        submitClickSubject.onNext(())
    }

    /*Outputs*/
    var loginResult: Observable<Int> {
        return submitClickSubject.asObservable().withLatestFrom(Observable.combineLatest(usernameSubject.asObservable(), passwordSubject.asObservable()) {
            ($0, $1)
        }).flatMapLatest { params -> Observable<User> in
            return AppEnvironment.current.api.request(target: .login(params.0, params.1))
        }.map {
            $0.id
        }
    }
    var canLogin: Driver<Bool> {
        return Observable.combineLatest(usernameSubject.asObservable(), passwordSubject.asObservable()) {
            ($0, $1)
        }.map {
            $0.0.count >= 8 && $0.1.count >= 6
        }.asDriver(onErrorJustReturn: false)
    }
}
