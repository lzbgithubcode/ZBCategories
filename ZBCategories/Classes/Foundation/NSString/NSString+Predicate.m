//
//  NSString+Predicate.m
//  ZBCategories
//
//  Created by lzb on 2018/8/14.
//  Copyright © 2018年 lzb. All rights reserved.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)
/**
 有效的电话号码
 
 @return YES/NO
 */
- (BOOL)isValidMobileNumber
{
    //运营商手机号段划分
    //总汇:13[0-9]、 14[5,7]、 15[0, 1, 2, 3, 5, 6, 7, 8, 9]、166、 17[6, 7, 8]、 18[0-9]、 170[0,5,9]、19[8,9]
    //中国移动: 134（0-8）、135、136、137、138、139、147(无线上网卡)、150、151、152、157、158、159、178、182、183、184、187、188、198(暂未启用)、1705(虚拟运营商号段)
    //中国联通: 130、131、132、145(无线上网卡)、155、156、166（暂未启用）、176、185、186、175（2015年9月10日正式启用，暂只对北京、上海和广东投放办理）、1709(虚拟运营商号段)
    //中国电信: 133、153、173、177、180、181、189、199、1700(虚拟运营商号段)
    
    
    NSString *mobileRegex = @"(^1(3[0-9]|4[57]|5[0-35-9]|66|7[6-8]|8[0-9]|9[8-9])\\d{8}$)|(^170[059]\\d{7}$)";
    //    NSString *MOBILE = @"(^1(3[0-9]|4[57]|5[0-35-9]|66|7[6-8]|8[0-9]|9[8-9])\\d{8}$)|(^170[059]\\d{7}$)";
    
    BOOL ret1 = [self zb_isValidateByRegex:mobileRegex];
    return ret1;
}

/**
 有效的邮箱
 
 @return YES/NO
 */
- (BOOL)isValidEmail
{
    
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self zb_isValidateByRegex:emailRegex];
    
}

/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 */
- (BOOL)isValidBankCardNumber
{
    NSString * lastNum = [[self substringFromIndex:(self.length-1)] copy];//取出最后一位
    NSString * forwardNum = [[self substringToIndex:(self.length -1)] copy];//前15或18位
    
    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
    
    for (int i=0; i< forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i%2) {//偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        }else{//奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal =0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    NSInteger lastNumber = [lastNum integerValue];
    
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal%10 ==0)?YES:NO;
}


/**
 检测有效身份证 15位
 
 @return YES/NO
 */
- (BOOL)isValidIdentifyFifteen
{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

/**
 检测有效身份证 18位
 
 @return YES/NO
 */
- (BOOL)isValidIdentifyEighteen
{
    NSString * identifyTest=@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

/**
 *  车牌号的有效性
 */
- (BOOL)isValidCarNumber
{
    //车牌号:湘K-DE829 香港车牌号码:粤Z-J499港
    NSString *carRegex = @"^[\u4e00-\u9fff]{1}[a-zA-Z]{1}[-][a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fff]$";//其中\u4e00-\u9fa5表示unicode编码中汉字已编码部分，\u9fa5-\u9fff是保留部分，将来可能会添加
    return [self zb_isValidateByRegex:carRegex];
}

/**
 *  IP地址有效性
 */
- (BOOL)isValidIPAddress
{
    NSString *regex = [NSString stringWithFormat:@"^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL rc = [pre evaluateWithObject:self];
    
    if (rc) {
        NSArray *componds = [self componentsSeparatedByString:@"."];
        
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        
        return v;
    }
    
    return NO;
}

/**
 *  Mac地址有效性
 */
- (BOOL)isValidMacAddress
{
    NSString * macAddRegex = @"([A-Fa-f\\d]{2}:){5}[A-Fa-f\\d]{2}";
    return  [self zb_isValidateByRegex:macAddRegex];
}

/**
 *  网址有效性
 */
- (BOOL)isValidUrl
{
    NSString *regex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    return [self zb_isValidateByRegex:regex];
}

/**
 *  纯汉字
 */
- (BOOL)isValidChinese
{
    NSString *chineseRegex = @"^[\u4e00-\u9fa5]+$";
    return [self zb_isValidateByRegex:chineseRegex];
}

/**
 *  邮政编码
 */
- (BOOL)isValidPostalcode
{
    NSString *postalRegex = @"^[0-8]\\d{5}(?!\\d)$";
    return [self zb_isValidateByRegex:postalRegex];
}


/**
 有效的真实姓名
 
 @return YES/NO
 */
- (BOOL)isValidRealName

{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [predicate evaluateWithObject:self];
}

/**
 有效的验证码
 
 @return YES/NO
 */
- (BOOL)isValidVerifyCode
{
    NSString *pattern = @"^[0-9]{4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}




/**
 有效的字母数字密码
 
 @return YES/NO
 */
- (BOOL)isValidAlphaNumberPassword
{
    NSString *regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [identityCardPredicate evaluateWithObject:self];
}





/**
 限制只能输入数字
 
 @return YES/NO
 */
- (BOOL)isOnlyNumber
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
}
/**
 判断字符串是否为空
 @return 是否
 */
- (BOOL)isBlankString
{
    NSString *string = self;
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
/**
 是否是纯数字字符串
 */
- (BOOL)isAllDigits
{
    NSCharacterSet *nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange range = [self rangeOfCharacterFromSet:nonNumbers];
    return range.location == NSNotFound;
}

#pragma mark - 正则相关
- (BOOL)zb_isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

@end
