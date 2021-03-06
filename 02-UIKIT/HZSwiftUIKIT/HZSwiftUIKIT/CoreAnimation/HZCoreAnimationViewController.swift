//
//  HZCoreAnimationViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2017/3/28.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit

class HZCoreAnimationViewController: UIViewController,CAAnimationDelegate {
    
    let blueLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        // add blue layer 
//
//        blueLayer.frame = CGRect(x:20, y: 200, width: 50, height: 30)
//        blueLayer.backgroundColor = UIColor.blue.cgColor
//        self.view.layer.addSublayer(blueLayer)

        
//        let button = UIButton()
//        button.frame = CGRect(x: 100, y: 400, width: 100, height: 50)
//        button.title(for: UIControlState.normal)
//        button.backgroundColor = UIColor.orange
//        /*
//           #selector的使用方法 （有参数的函数如何使用#selector创建selector）
//           （1）addBlueLayer as (UIButton)->()
//           （2）addBlueLayer(button:)
//         */
//        button.addTarget(self, action: #selector(playAnimationWithBlcok), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(button)
//
//        // 创建一个View然后以动画的形式改变其width和height
//        let view = UIView(frame: CGRect(x: 40, y: 40, width: 240, height: 240))
//        view.backgroundColor = UIColor.red
//        view.tag = 1
//        self.view.addSubview(view)
        
        frameAnimation()
    }
    
   @objc func playAnimationWithBlcok() -> Void {
    UIView.animate(withDuration: 5, delay: 0, options: [.curveEaseOut], animations: {
        let view = self.view.viewWithTag(1)
        view?.frame = CGRect(x: 40, y: 40, width: 0, height: 0)
        view?.backgroundColor = UIColor.blue
        view?.alpha = 0
    }) {
         (value:Bool) in
          self.view.viewWithTag(1)?.removeFromSuperview()
       }
    
    }
    
    
    // 执行视图的缩小动画
   @objc func playAnimation() -> Void {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(.easeOut) //播放速度变化曲线；easeOut：由快到慢； easeInOut：慢->快->慢
        UIView.setAnimationDuration(5)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        let view = self.view.viewWithTag(1)
//        view?.frame = CGRect(x: 40, y: 40, width: 0, height: 0)
//        view?.backgroundColor = UIColor.blue
//        view?.alpha = 0
    /*
      UIView的过渡效果
         flipFromLeft : 视图从左到右滑入屏幕
         flipFromRight :
         curlUp : 向上翻页
         curlDowmn : 向下翻页
     
     
     */
        UIView.setAnimationTransition(.flipFromLeft, for: view!, cache: true)
    
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(animationStop))
        UIView.commitAnimations()
    }
    
     @objc func animationStop() -> Void {
        //self.view.viewWithTag(1)?.removeFromSuperview()
    }
    
    // 使用UIImageView播放帧动画
    
    func imageViewWithFrameAnimation() -> Void {
        let imageView = UIImageView()
        imageView.animationImages = []
        imageView.animationDuration = 5
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    
    /*
        在view上增加一个图层
     */
    
    func addBlueLayer(button:UIButton) {
        button.backgroundColor = UIColor.red
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(blueLayer)
    }
    
    /*
       利用图层给视图家背景图片
     */
    
    func addImageOnLayer(){
        let image = UIImage(named: "desktop")
        self.view.layer.contents = image?.cgImage
        
        /*
          UIImageView:当图片显示不合适时，可以更改contentMode的属性
          contents也可以设置contentsGravity 来修正图片的显示
         
         */
    }
    
    /*
       在图层上绘制
     */
    
    func drawSomethingOnLayer(){
       
    }
    
    /*
       图层做变换
     */
    
    func layerTransform(){
        
        // 旋转45度
        let transformrotated =  blueLayer.affineTransform().rotated(by: CGFloat(M_PI_4))
        blueLayer.setAffineTransform(transformrotated)
        
        // 放大二倍
        let transformscaled = blueLayer.affineTransform().scaledBy(x: 2.0, y: 2.0)
        blueLayer.setAffineTransform(transformscaled)
        
        // 平移 X轴 和 Y轴
       let transformstranslated = blueLayer.affineTransform().translatedBy(x: 50, y: 50)
        blueLayer.setAffineTransform(transformstranslated)
        
    }
    
    /*
       视图的变换
     */
    
    @objc func scaledImageView(){
        let imageView = UIImageView(frame: CGRect(x: 180, y: 100, width: 100, height: 20))
        imageView.image = UIImage(named: "desktop")
        self.view.addSubview(imageView)
        //将图片整体方法2倍
        imageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    
    }
    
    
    // --------  关键帧动画 ------
    
    /*
       关键帧动画： 通过对某个属性设置一组不同的数值，然后由系统自动生成相邻数值之间的线性过渡帧
       起始关键帧 ----> 过渡帧 ------> 结束关键帧
     */

    
    func frameAnimation() -> Void {
        let imageView = UIImageView(frame: CGRect(x: 40, y: 80, width: 64, height: 64))
        imageView.image = UIImage(named: "desktop")
        self.view.addSubview(imageView)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        let point1 = CGPoint(x: 40, y: 80)
        let point2 = CGPoint(x: 280, y: 80)
        let point3 = CGPoint(x: 60, y: 300)
        let point4 = CGPoint(x: 280, y: 300)
        
        animation.values = [NSValue(cgPoint: point1),NSValue(cgPoint: point2),NSValue(cgPoint: point3),NSValue(cgPoint: point4)]
        animation.keyTimes = [NSNumber(value: 0.0),NSNumber(value: 0.4),NSNumber(value: 0.6),NSNumber(value: 1.0)]
        animation.delegate = self
        animation.duration = 5.0;
        
        imageView.layer.add(animation, forKey: "Move")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
         // 动画开始
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        // 动画结束
        
    }
    
    
    //        ------  Core Animation ：                                                                                                       -------
    
    /*
     Core Animation ： 是一个复合引擎，它的职责是尽可能快地组合屏幕上不同的可视化内容，这个内容被分解成独立的图层，
     存储在一个叫图层树的体系之中；这个树就构成了iOS应用程序屏幕所看见的一切基础。
     
                             CAAnimation
     
        CAPropertyAnimation   CATransition    CAAnimationGroup
            |
            |
     
     CABasicAnimation CAKeyframeAnimation
     */
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
