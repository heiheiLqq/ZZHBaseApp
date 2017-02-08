//
//  UIImage+Extension.h
//  BaisibudejieApp
//
//  Created by 庄子豪 on 16/6/17.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 * 圆形图片
 */
- (UIImage *)circleImage;
/**
 * 圆形不要被渲染
 */
+ (UIImage *)imageRenderingModeImageNamed:(NSString *)imageName;
/**
 *  等比缩放
 *
 *  @param size 设置尺寸
 *
 *  @return image
 */
-(UIImage *)scaleImageToSize:(CGSize)size;
/**
 *  自定长宽
 *
 *  @param reSize 设置尺寸
 *
 *  @return image
 */
-(UIImage *)imageReSize:(CGSize)reSize;
/**
 *  剪切
 *
 *  @param cutRect 选取截取部分
 *
 *  @return image
 */
-(UIImage *)cutImageWithRect:(CGRect)cutRect;
/**
 *  压缩
 *
 *  @param image 待压缩的图片
 *
 *  @return image
 */
+ (UIImage *)smallTheImage:(UIImage *)image;
/**
 *  压缩（上传）
 *
 *  @param image 待压缩图片
 *
 *  @return 图片的二进制文件
 */
+ (NSData *)smallTheImageBackData:(UIImage *)image;
/**
 *  view转位图（一般用于截图）
 *
 *  @param view 需要转化的view
 *
 *  @return image
 */
+ (UIImage *)imageFromView:(UIView*)view;

- (NSString *)saveImageToDocument:(NSString *)filePath;


/**
 *  根据颜色生成图片
 *
 *  @param color 指定颜色
 *
 *  @return 根据颜色生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据blur生成毛玻璃图
 *
 *  @param blur 0~1   1最模糊
 *
 *  @return 根据blur生成毛玻璃图
 */
- (UIImage *)boxblurImageWithBlur:(CGFloat)blur;

+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

/**
 *  图片等比压缩
 *
 *  @param targetSize 压缩尺寸
 *
 *  @return UIImage
 */
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

/**
 *  图片旋转
 *
 *  @param angle 旋转角度
 *
 *  @return UIImage
 */
- (UIImage *)imageByRotatingImage:(CGFloat)angle;

/**
 *  图片存储
 *
 *  @param filePath 存储路径
 *
 *  @return 路径
 */
- (NSString *)writeToFilePath:(NSString *)filePath;

/**
 *  图片缩放到某一尺寸
 *
 *  @param img  图片
 *  @param size 目标尺寸
 *
 *  @return UIImage
 */
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

- (UIImage *)imageCompressForWidth:(CGFloat)defineWidth;

/**
 *  屏幕截屏
 *
 *  @param view 当前界面
 *
 *  @return 图片
 */
+ (UIImage *)captureImageFromView: (UIView *)view;



@end
