//
//  PreBrewingSelectionViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 13.07.2022.
//

import UIKit
import Segmentio
import FlexibleSteppedProgressBar
import Shuffle

class PreBrewingSelectionViewController: UIViewController {
    
    lazy var optionsCardStack: SwipeCardStack = {
        let cardStack = SwipeCardStack()
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        cardStack.delegate = self
        cardStack.dataSource = self
        return cardStack
    }()
    
    lazy var prebrewingSettingsStepper: FlexibleSteppedProgressBar = {
        let steppedProgressBar = FlexibleSteppedProgressBar()
        steppedProgressBar.translatesAutoresizingMaskIntoConstraints = false
        steppedProgressBar.delegate = self
        steppedProgressBar.numberOfPoints = 5
        steppedProgressBar.lineHeight = 9
        steppedProgressBar.radius = 15
        steppedProgressBar.progressRadius = 25
        steppedProgressBar.progressLineHeight = 3
        return steppedProgressBar
    }()
    
    lazy var optionSelectionSegmentedControl: Segmentio = {
        let segmentioViewRect = CGRect(x: 0, y: 0, width: 340, height: 125)
        let segmentedControl = Segmentio(frame: segmentioViewRect)
        segmentedControl.selectedSegmentioIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    lazy var selectOptionButton: TTButton = {
        let selectOptionButton = TTButton(buttonType: .selectOption, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        return selectOptionButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presentCardsStack()
        configureOptionSelectionSegmentedControl()
        segmentedControlDidChangedValue()
        //configureOptionSelectionSegmentedControl()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureOptionSelectionSegmentedControl() {
        optionSelectionSegmentedControl.setup(content: [
            .init(title: "Loose", image: UIImage(named: "IMG_2652-Yj5ZrggRX")!),
            .init(title: "Pressed", image: UIImage(named: "shuPuerhPressed"))],
            style: .imageUnderLabel,
            options: SegmentioOptions.TTStyleSegmentioOptions)
        presentOptionSelectionSegmentedControl()
    }
    
    
    private func presentOptionSelectionSegmentedControl() {
        view.addSubview(optionSelectionSegmentedControl)
        NSLayoutConstraint.activate([
            optionSelectionSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            optionSelectionSegmentedControl.heightAnchor.constraint(equalToConstant: 100),
            optionSelectionSegmentedControl.widthAnchor.constraint(equalToConstant: 340),
            optionSelectionSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    private func presentCardsStack() {
        view.addSubview(optionsCardStack)
        NSLayoutConstraint.activate([
            optionsCardStack.widthAnchor.constraint(equalToConstant: 340),
            optionsCardStack.heightAnchor.constraint(equalToConstant: 533),
            optionsCardStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            optionsCardStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
    }
    
    private func presentPrebrewingStepper() {
        view.addSubview(prebrewingSettingsStepper)
        NSLayoutConstraint.activate([
            prebrewingSettingsStepper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            prebrewingSettingsStepper.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            prebrewingSettingsStepper.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }

    private func segmentedControlDidChangedValue() {
        optionSelectionSegmentedControl.valueDidChange = { [self] segmentio, segmentIndex in
            print("SegmentedIndex: \(segmentIndex)")
            optionsCardStack.shift(withDistance: segmentIndex == 1 ? -1 : 1, animated: true)
        }
    }
}

extension PreBrewingSelectionViewController: FlexibleSteppedProgressBarDelegate {
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                 didSelectItemAtIndex index: Int) {
        print("Index selected!")
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                 willSelectItemAtIndex index: Int) {
        print("Index selected!")
    }

    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     canSelectItemAtIndex index: Int) -> Bool {
        return true
    }

    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if position == FlexibleSteppedProgressBarTextLocation.bottom {
            switch index {
                
            case 0: return "First"
            case 1: return "Second"
            case 2: return "Third"
            case 3: return "Fourth"
            case 4: return "Fifth"
            default: return "Date"
                
            }
        }
    return ""
    }
}

extension PreBrewingSelectionViewController: SwipeCardStackDelegate, SwipeCardStackDataSource {
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let optionCardDescriptions = [
            PrebrewingOptionCardDescription(optionTitle: "Loose", optionDescription: "BL BL BL  BL BL BL", image: UIImage(named: "IMG_2652-min")!),
            PrebrewingOptionCardDescription(optionTitle: "Pressed", optionDescription: "BLA BLA BLA BLA", image: UIImage(named: "IMG_2653-min")!)]
        
        let swipeCard = PrebrewingOptionCardView(cardDescription: optionCardDescriptions[index])
        return swipeCard
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return 2
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        print("Did select card")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        optionSelectionSegmentedControl.selectedSegmentioIndex = index
//        if direction == .left {
//            optionSelectionSegmentedControl.selectedSegmentioIndex = index
//        } else if direction == .right {
//            optionSelectionSegmentedControl.selectedSegmentioIndex = index - 1
//        }
        print("SegmentIndex: \(optionSelectionSegmentedControl.selectedSegmentioIndex), LastIndex: \(index)")
        print("Stop it!")
        print(index)
      //  cardStack.undoLastSwipe(animated: true)
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        cardStack.undoLastSwipe(animated: true)
    }
    
}
