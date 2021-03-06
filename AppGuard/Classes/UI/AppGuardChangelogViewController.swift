// The MIT License (MIT)
//
// Copyright (c) 2018 Smart&Soft
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public class AppGuardChangelogViewController: AppGuardViewController, AppGuardable {
  
  @IBOutlet public weak var ibTextView: UITextView?
  
  public var coordinator: AppGuardCoordinator?
  
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    let nibName = "AppGuardChangelogViewController"
    let bundle: Bundle = Bundle.bundleForResource(name: nibName, ofType: "nib")
    
    super.init(nibName: nibName, bundle: bundle)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    self.ibTextView?.textColor = AppGuard.default.graphicContext.contentColor
    self.ibTextView?.font = AppGuard.default.graphicContext.contentFont
    self.ibTextView?.text = AppGuard.default.configuration.changelogContent
    
    self.ibTitleLabel?.text = AppGuard.default.configuration.title
    self.ibActionButton?.setTitle(AppGuard.default.configuration.actionButtonLabel,
                                  for: .normal)
    
    
  }
  
  @IBAction public func didTapActionButton(_ sender: Any) {    
    self.coordinator?.didChooseAction()
  }
}
