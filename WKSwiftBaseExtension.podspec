#
# Be sure to run `pod lib lint WKSwiftBaseExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WKSwiftBaseExtension'
  s.version          = '0.1.2'
  s.summary          = '自己封装的基本库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 自己封装的基本库
                       DESC

  s.homepage         = 'https://github.com/sevemal/WKSwiftBaseExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sevemal@126.com' => 'sevemal@126.com' }
  s.source           = { :git => 'https://github.com/sevemal/WKSwiftBaseExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.source_files = 'WKSwiftBaseExtension/Classes/**/*'
  s.swift_version = '4.2'
   s.resource_bundles = {
     'WKSwiftBaseExtension' => ['WKSwiftBaseExtension/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'SnapKit'
end
