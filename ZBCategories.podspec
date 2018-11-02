#
# Be sure to run `pod lib lint ZBCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZBCategories'
  s.version          = '0.0.1'
  s.summary          = 'ZBCategories'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 自定义分类，包括UIKit  Foundation
                       DESC

  s.homepage         = 'https://github.com/lzbgithubcode/ZBCategories'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1835064412@qq.com' => 'liuzibin' }
  s.source           = { :git => 'https://github.com/lzbgithubcode/ZBCategories.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZBCategories/Classes/ZBCategories.h'

  s.subspec 'Foundation' do |f|
    f.source_files = 'TBCommonLibrary/Classes/Foundation/**/*.{h,m}'
  end

  s.subspec 'QuartzCore' do |q|
    q.source_files = 'TBCommonLibrary/Classes/QuartzCore/**/*.{h,m}'
  end

  s.subspec 'UIKit' do |kit|
    kit.source_files = 'TBCommonLibrary/Classes/UIKit/**/*.{h,m}'
  end
  
  # s.resource_bundles = {
  #   'ZBCategories' => ['ZBCategories/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
