//
//  PostViewController.swift
//  SICT
//
//  Created by 여진홍 on 2022/11/26.
//

import UIKit
import SnapKit

class PostViewController: UIViewController {
    private lazy var profilePhoto: UIImageView = { // var: 변수 설정
        let photo = UIImageView() // let: 상수
        photo.layer.borderWidth = 1
        photo.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return photo
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "사용자 이름"    // 코드 길어질때 0000.붙인다 .text 하면 화면에 적은 text 보임
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        return label
    }()
    
    private lazy var textBox: UITextView = {
        let textview = UITextView()
        textview.layer.borderWidth = 1.0
        textview.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        textview.font = .systemFont(ofSize: 18)
        textview.text = "텍스트를 입력하세요"
        textview.textColor = .lightGray
        textview.delegate = self  // delegate 사용시 밑에 extension 써주기
        textview.translatesAutoresizingMaskIntoConstraints = false
        
        return textview
        
    }()
    /*
    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false // button 사용시 반드시 필요
        
    }()
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("작성", for: .normal)
    }()*/
    
    override func viewDidLoad() { // 얘가 화면에 뜨게 해주는것
        super.viewDidLoad()
        setupLayout()
        navigation()
        
    }
    
    func navigation() {
        // xButton, postButton은 navigation
    }
    
    func setupLayout() { // func: 함수
        [profilePhoto,userName,textBox].forEach{view.addSubview($0)}
        
        // 4개를 다 잡아주거나, width height까지 잡아주기
        
        profilePhoto.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10.0)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(10.0)
        }
        
        userName.snp.makeConstraints{
            $0.leading.equalTo(profilePhoto.snp.trailing).inset(3.0)
            $0.top.equalTo(profilePhoto.snp.top) // 프로필과 똑같은 높이에 잇음
        }
        
        textBox.snp.makeConstraints{
            $0.top.equalTo(profilePhoto.snp.bottom).inset(6.0)
            $0.leading.equalTo(profilePhoto.snp.leading)
            // 여기부터 내가 시작
        }
        
        
    }
}

extension PostViewController: UITextViewDelegate{
    
}






/*xButton.snp.makeConstraints{
    $0.top.equalTo(view.safeAreaLayoutGuide).inset(6.0)
    $0.leading.equalTo(view.safeAreaLayoutGuide).inset(6.0)
}

postButton.snp.makeConstraints{
    $0.top.equalTo(view.safeAreaLayoutGuide).inset(6.0)
    $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(6.0)
}*/
