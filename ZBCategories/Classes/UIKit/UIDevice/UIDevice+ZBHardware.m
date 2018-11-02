//
//  UIDevice+ZBHardware.m
//  ZBCategories
//
//  Created by lzb on 2018/10/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIDevice+ZBHardware.h"
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <mach-o/arch.h>
// 下面是获取mac地址需要导入的头文件
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

// 下面是获取ip需要的头文件
#include <ifaddrs.h>


#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>

@implementation UIDevice (ZBHardware)
/**
 设备信息 -官方信息
 */
+ (NSString *)devicePlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

/**
 设备信息 - 可以看懂的设备型号
 */
+ (NSString *)devicePlatformString
{
    NSString *platform = [self devicePlatform];
    if ([platform hasPrefix:@"iPhone"]) {
        if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
        if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
        if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
        if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
        if ([platform isEqualToString:@"iPhone10,6"])    return @"iPhone X";
        if ([platform isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
        if ([platform isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
        if ([platform isEqualToString:@"iPhone10,3"])    return @"iPhone X";
        if ([platform isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus";
        if ([platform isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
        if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
        if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
        if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
        if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
        if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
        if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
        if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
        if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
        if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
        if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
        if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
        if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
        if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
        if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
        if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
        if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
        if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
        if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
        if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
        if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
        if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
        if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
        
    } else if ([platform hasPrefix:@"iPad"]) {
        
        if ([platform isEqualToString:@"iPad7,1"])    return @"iPad Pro 12.9";
        if ([platform isEqualToString:@"iPad7,2"])    return @"iPad Pro 12.9";
        if ([platform isEqualToString:@"iPad7,3"])    return @"iPad Pro 10.5";
        if ([platform isEqualToString:@"iPad7,4"])    return @"iPad Pro 10.5";
        if ([platform isEqualToString:@"iPad6,8"])    return @"iPad Pro";
        if ([platform isEqualToString:@"iPad6,7"])    return @"iPad Pro";
        if ([platform isEqualToString:@"iPad6,4"])    return @"iPad Pro";
        if ([platform isEqualToString:@"iPad6,3"])    return @"iPad Pro";
        if ([platform isEqualToString:@"iPad5,4"])    return @"iPad Air2";
        if ([platform isEqualToString:@"iPad5,3"])    return @"iPad Air2";
        if ([platform isEqualToString:@"iPad5,2"])    return @"iPad Mini4";
        if ([platform isEqualToString:@"iPad5,1"])    return @"iPad Mini4";
        if ([platform isEqualToString:@"iPad4,9"])    return @"iPad Mini3";
        if ([platform isEqualToString:@"iPad4,8"])    return @"iPad Mini3";
        if ([platform isEqualToString:@"iPad4,7"])    return @"iPad Mini3";
        if ([platform isEqualToString:@"iPad4,6"])    return @"iPad Mini2";
        if ([platform isEqualToString:@"iPad4,5"])    return @"iPad Mini2";
        if ([platform isEqualToString:@"iPad4,4"])    return @"iPad Mini2";
        if ([platform isEqualToString:@"iPad4,3"])    return @"iPad Air";
        if ([platform isEqualToString:@"iPad4,2"])    return @"iPad Air";
        if ([platform isEqualToString:@"iPad4,1"])    return @"iPad Air";
        if ([platform isEqualToString:@"iPad3,6"])    return @"iPad 4";
        if ([platform isEqualToString:@"iPad3,5"])    return @"iPad 4";
        if ([platform isEqualToString:@"iPad3,4"])    return @"iPad 4";
        if ([platform isEqualToString:@"iPad3,3"])    return @"iPad 3";
        if ([platform isEqualToString:@"iPad3,2"])    return @"iPad 3";
        if ([platform isEqualToString:@"iPad3,1"])    return @"iPad 3";
        if ([platform isEqualToString:@"iPad2,7"])    return @"iPad Mini";
        if ([platform isEqualToString:@"iPad2,6"])    return @"iPad Mini";
        if ([platform isEqualToString:@"iPad2,5"])    return @"iPad Mini";
        if ([platform isEqualToString:@"iPad2,4"])    return @"iPad 2";
        if ([platform isEqualToString:@"iPad2,3"])    return @"iPad 2";
        if ([platform isEqualToString:@"iPad2,2"])    return @"iPad 2";
        if ([platform isEqualToString:@"iPad2,1"])    return @"iPad 2";
        if ([platform isEqualToString:@"iPad1,1"])    return @"iPad 1";
        
    } else if ([platform hasPrefix:@"iPod"]) {
        if ([platform isEqualToString:@"iPod7,1"])    return @"iPod 6";
        if ([platform isEqualToString:@"iPod5,1"])    return @"iPod 5";
        if ([platform isEqualToString:@"iPod4,1"])    return @"iPod 4";
        if ([platform isEqualToString:@"iPod3,1"])    return @"iPod 3";
        if ([platform isEqualToString:@"iPod2,1"])    return @"iPod 2";
        if ([platform isEqualToString:@"iPod1,1"])    return @"iPod 1";
    } else {
        if ([platform isEqualToString:@"i386"])       return @"simulator";
        if ([platform isEqualToString:@"x86_64"])     return @"simulator";
    }
    return @"unknown";
}
+ (BOOL)isSimulator {
    if ([[self devicePlatform] isEqualToString:@"i386"] || [[self devicePlatform] isEqualToString:@"x86_64"]) {
        return YES;
    } else {
        return NO;
    }
}
+ (BOOL)isiPad {
    if ([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPad"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isiPhone {
    if ([[[self devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"]) {
        return YES;
    } else {
        return NO;
    }
}
/**
 获取设备名称
 */
+ (NSString *)deviceName
{
    NSString *name = [UIDevice currentDevice].name;
    return name?: @"Unknown";;
}
/**
 获取设备系统版本
 */
+ (NSString *)deviceSystemVersion
{
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    return systemVersion?: @"Unknown";
}
/**
 获取设备语言
 */
+ (NSString *)deviceLanguage
{
    return [NSLocale preferredLanguages].firstObject ?: @"Unknown";
}
/**
 获取设备电量
 */
+ (NSString *)deviceBattery
{
    NSString *battery = [UIDevice currentDevice].batteryLevel != -1 ? [NSString stringWithFormat:@"%ld%%",(long)([UIDevice currentDevice].batteryLevel * 100)] : @"Unknown";
    return battery;
}
/**
 获取设备CPU类型
 */
+ (NSString *)deviceCPUType
{
    NSString *cpuSubtypeString = [NSString stringWithUTF8String:NXGetLocalArchInfo()->description];
    cpuSubtypeString = cpuSubtypeString ?:@"Unknown";
    return cpuSubtypeString;
}
/**
 获取设备网络状态
 */
+ (NSString *)deviceNetworkState
{
    NSString *state = [self networkingStatesFromStatusbar];
    return state;
}
/**
 获取设备IP地址
 */
+ (NSString *)deviceIPAddress
{
    NSString *ipAddress = [self getDeviceCurrentIPAddresses];
    return ipAddress?:@"Unknown";
}
/**
 获取设备MAC地址
 */
+ (NSString *)deviceMACAddress
{
    NSString *macAddress = [self getMacAddress];
    return macAddress ?: @"Unknown";
}

/**
 获取设备的UUID
 */
+ (NSString *)deviceUUID
{
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return uuid;
}

/**
 获取手机内存总量, 返回的是字节数
 */
+ (NSUInteger)deviceTotalMemoryBytes
{
    size_t size = sizeof(int);
    int result;
    int mib[2] = {CTL_HW, HW_PHYSMEM};
    sysctl(mib, 2, &result, &size, NULL, 0);
    return (NSUInteger)result;
}
/**
 获取手机可用内存, 返回的是字节数
 */
+ (NSUInteger)deviceFreeMemoryBytes
{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    
    host_page_size(host_port, &pagesize);
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        return 0;
    }
    unsigned long mem_free = vm_stat.free_count * pagesize;
    return mem_free;
}


/**
 获取手机硬盘总空间, 返回字符串
 */
+ (NSString *)deviceTotalDiskSpaceBytes
{
    return [NSByteCountFormatter stringFromByteCount:[self getTotalDiskSpace] countStyle:NSByteCountFormatterCountStyleFile];
}

/**
 获取手机硬盘空闲空间, 返回字符串
 */
+ (NSString *)deviceFreeDiskSpaceBytes
{
  return [NSByteCountFormatter stringFromByteCount:[self getFreeDiskSpace] countStyle:NSByteCountFormatterCountStyleFile];
}

#pragma mark -获取磁盘的空间
// 获取磁盘总空间
+ (int64_t)getTotalDiskSpace {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];
    if (space < 0) space = -1;
    return space;
}
// 获取未使用的磁盘空间
+ (int64_t)getFreeDiskSpace {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    int64_t space =  [[attrs objectForKey:NSFileSystemFreeSize] longLongValue];
    if (space < 0) space = -1;
    return space;
}

#pragma mark - 网络状态
+ (NSString *)networkingStatesFromStatusbar {
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = nil;
    if ([[app valueForKeyPath:@"_statusBar"] isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")]) {
        children = [[[[app valueForKeyPath:@"_statusBar"] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    } else {
        children = [[[app valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    }
    
    NSInteger type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    NSString *stateString = @"WiFi";
    
    switch (type) {
        case 0:
            stateString = @"无网络";
            break;
        case 1:
            stateString = @"2G";
            break;
        case 2:
            stateString = @"3G";
            break;
        case 3:
            stateString = @"4G";
            break;
        case 4:
            stateString = @"LTE";
            break;
        case 5:
            stateString = @"WiFi";
            break;
        default:
            stateString = @"Unknown";
            break;
    }
    
    return stateString;
}

#pragma mark - 获取MAC地址
+ (NSString *)getMacAddress {
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [outstring uppercaseString];
}
#pragma mark - 获取IP地址
+ (NSString *)getDeviceCurrentIPAddresses {
    
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    
    NSMutableArray *ips = [NSMutableArray array];
    
    int BUFFERSIZE = 4096;
    
    struct ifconf ifc;
    
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    
    struct ifreq *ifr, ifrcopy;
    
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    
    close(sockfd);
    NSString *deviceIP = @"";
    
    for (int i=0; i < ips.count; i++) {
        if (ips.count > 0) {
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    return deviceIP;
}
@end
