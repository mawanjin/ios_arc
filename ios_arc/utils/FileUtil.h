//
//  FileUtil.h
//  ios_arc
//
//  Created by lala on 2019/2/22.
//  Copyright © 2019 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileUtil : NSObject

/**
 *  获取 home 路径
 *
 */
+(NSString *)homeDirectoryPath;
/**
 *  获取 app 路径
 *
 */
+ (NSString *)appDirectoryPath;
/**
 *  获取 document 路径
 *
 */
+ (NSString *)documentDirectoryPath;

/**
 *  获取 caches 路径
 *
 */
+ (NSString *)cachesDirectoryPath;

/**
 *  获取 tmp 路径
 *
 *
 */
+ (NSString *)tmpDirectoryPath;

/**
 *  判断目录是否存在
 *
 *  @param directoryPath 目录路径
 *
 */
+ (BOOL)directoryExist:(NSString *)directoryPath;

/**
 *  判断文件是否存在
 *
 *  @param filePath 文件路径
 *
 */
+ (BOOL)fileExist:(NSString *)filePath;

/**
 *  在父目录下创建子目录
 *
 *  @param parentDirectoryPath 父目录路径
 *  @param directoryName       子目录名称
 *
 *
 */
+ (BOOL)createDirectoryAtParentDirectory:(NSString *)parentDirectoryPath directoryName:(NSString *)directoryName;

/**
 *  在父目录下创建子文件
 *
 *  @param parentDirectoryPath 父目录路径
 *  @param fileName            子文件名称
 *
 *
 */
+ (BOOL)createFileAtParentDirectory:(NSString *)parentDirectoryPath fileName:(NSString *)fileName;

/**
 *  删除目录
 *
 *  @param directoryPath 目录路径
 *
 *
 */
+ (BOOL)deleteDirectoryAtPath:(NSString *)directoryPath;

/**
 *  删除文件
 *
 *  @param filePath 文件路径
 *
 *
 */
+ (BOOL)deleteFileAtPath:(NSString *)filePath;

/**
 *  获取父目录下的子内容（包含目录和文件）
 *
 *  @param parentDirectoryPath 父目录路径
 *
 *
 */
+ (NSArray *)contentsAtParentDirectory:(NSString *)parentDirectoryPath;

/**
 *  获取父目录下的所有子目录名称
 *
 *  @param parentDirectoryPath 父目录路径
 *
 *
 */
+ (NSArray *)directoryNamesAtParentDirectory:(NSString *)parentDirectoryPath;

/**
 *  获取父目录下的所有子目录路径
 *
 *  @param parentDirectoryPath 父目录路径
 *
 *
 */
+ (NSArray *)directoryPathsAtParentDirectory:(NSString *)parentDirectoryPath;

/**
 *  获取父目录下的所有子文件名称
 *
 *  @param parentDirectoryPath 父目录路径
 *
 *
 */
+ (NSArray *)fileNamesAtParentDirectoryPath:(NSString *)parentDirectoryPath;

/**
 *  获取父目录下的所有子文件路径
 *
 *  @param parentDirectoryPath 父目录路径
 *
 *
 */
+ (NSArray *)filePathsAtParentDirectoryPath:(NSString *)parentDirectoryPath;



@end

NS_ASSUME_NONNULL_END
