//
//  MVVM.swift
//  CoordinatorsDemo
//
//  Created by Алексей Папин on 04.02.2021.
//

import UIKit

// MARK: - ViewModel
protocol ViewModel {
    func initialSetup()
    func viewDidLoad()
    func didBindUIWithViewModel()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

// MARK: - ViewController
protocol ViewController: UIViewController {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType { get }
}

// MARK: - BaseViewModel
class BaseViewModel: NSObject, ViewModel {
    func initialSetup() {}
    func viewDidLoad() {}
    func didBindUIWithViewModel() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}
    func viewDidDisappear(_ animated: Bool) {}
}

// MARK: - BaseViewController
class BaseViewController<ViewModelType: ViewModel>: UIViewController, ViewController {
    var viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        viewModel.initialSetup()
    }
    
    func setupUI() {}

    func bindUIWithViewModel() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
        bindUIWithViewModel()
        viewModel.didBindUIWithViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewDidDisappear(animated)
    }
}
