//
//  ContructDialog.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 07/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//


import Foundation
import UIKit

class ConstructDialog{
    
    static func ConstructProgressDialog(dialogTitle : String, dialogMessage : String) -> DialogBox{
        let dialogBox = DialogBox()
        dialogBox.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        dialogBox.progressDialog = true
        dialogBox.progressTitle = dialogTitle
        dialogBox.progressMessage = dialogMessage
        return dialogBox
    }
    
    static func ConstructOneButtonDialog(dialogTitle : String, dialogMessage : String, okBtnText : String) -> DialogBox{
        let dialogBox = DialogBox()
        dialogBox.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        dialogBox.progressDialog = false;
        dialogBox.oneButtonDialog = true;
        dialogBox.dialgoMessage = dialogMessage;
        dialogBox.dialogTitle = dialogTitle;
        dialogBox.leftDialogButtonText = okBtnText;
        return dialogBox;
    }
    
    static func ConstructTwoButtonDialog(dialogTitle : String, dialogMessage : String, leftBtnText : String, rightBtnText : String) -> DialogBox{
        let dialogBox = DialogBox()
        dialogBox.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        dialogBox.progressDialog = false;
        dialogBox.oneButtonDialog = false;
        dialogBox.twoButtonDialog = true;
        dialogBox.dialgoMessage = dialogMessage;
        dialogBox.dialogTitle = dialogTitle;
        dialogBox.leftDialogButtonText = leftBtnText;
        dialogBox.rightDialogButtonText = rightBtnText;
        return dialogBox;
    }
    
}
