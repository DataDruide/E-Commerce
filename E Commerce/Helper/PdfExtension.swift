
import Foundation
import SwiftUI

extension View{
    
    func sharePDF<Content: View> (@ViewBuilder content: @escaping () -> Content, fileName: String) {
        exportPDF(content: content, completion: { status , url in
            if let url = url, status {
                ShareSheet.instance.share(items: [url])
            } else {
                print("⚠️ Failed to make PDF")
            }
        }, fileName: fileName)
    }
    
    // MARK: Extracting View's Height and width with the Help of Hosting Controller and ScrollView
    fileprivate func convertToScrollView<Content: View>(@ViewBuilder content: @escaping ()->Content)->UIScrollView{
        
        let scrollView = UIScrollView()
        
        // MARK: Converting SwiftUI View to UIKit View
        let hostingController = UIHostingController(rootView: content()).view!
        hostingController.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Constraints
        let constraints = [
        
            hostingController.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Width Anchor
            hostingController.widthAnchor.constraint(equalToConstant: screenBounds().width)
        ]
        scrollView.addSubview(hostingController)
        scrollView.addConstraints(constraints)
        scrollView.layoutIfNeeded()
        
        return scrollView
    }
    
    // MARK: Export to PDF
    // MARK: Completion Handler will Send Status and URL
    fileprivate func exportPDF<Content: View>(@ViewBuilder content: @escaping ()->Content,completion: @escaping (Bool,URL?)->(), fileName: String){
        
        // MARK: Temp URL
        let documentDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        // MARK: To Generate New File when ever its generated
        let outputFileURL = documentDirectory.appendingPathComponent("\(fileName)\(UUID().uuidString).pdf")
        
        // MARK: PDF View
        let pdfView = convertToScrollView {
            content()
        }
        pdfView.tag = 1009
        let size = pdfView.contentSize
        // Removing Safe Area Top Value
        pdfView.frame = CGRect(x: 0, y: getSafeArea().top, width: size.width, height: size.height)
        
        // MARK: Attaching to Root View and rendering the PDF
        getRootController().view.insertSubview(pdfView, at: 0)
        
        // MARK: Rendering PDF
        let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        do{
            
            try renderer.writePDF(to: outputFileURL, withActions: { context in
                
                context.beginPage()
                pdfView.layer.render(in: context.cgContext)
            })
            
            completion(true,outputFileURL)
        }
        catch{
            completion(false,nil)
            print(error.localizedDescription)
        }
        
        // Removing the added View
        getRootController().view.subviews.forEach { view in
            if view.tag == 1009{
                print("Removed")
                view.removeFromSuperview()
            }
        }
    }
    
    fileprivate func screenBounds()->CGRect{
        return UIScreen.main.bounds
    }
    
    fileprivate func getRootController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
    
    fileprivate func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}
