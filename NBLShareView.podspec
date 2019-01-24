#
# Be sure to run `pod lib lint NBLShareView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBLShareView'
  s.version          = '0.1.2'
  s.summary          = 'Object-C。用于分享场景的一套UI，内置微信分享等的图标元素。NBLShareView is a set for share.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Object-C。用于分享场景的一套UI，内置微信分享、QQ分享、复制链接、保存到相册等的常用图标元素。NBLShareView is a set for share.
                       DESC

  s.homepage         = 'https://github.com/yjh4866/NBLShareView'
  # s.screenshots     = 'www.github.com/screenshots_1.jpg', 'www.github.com/screenshots_2.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '杨建红' => 'yjh4866@163.com' }
  s.source           = { :git => 'https://github.com/yjh4866/NBLShareView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://blog.csdn.net/yjh4866'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NBLShareView/Classes/**/*'
  
  s.resource_bundles = {
    'NBLShareView' => ['NBLShareView/Assets/*.{xib,png}']
  }

  s.public_header_files = 'NBLShareView/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'Masonry'
end
