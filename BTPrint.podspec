#
# Be sure to run `pod lib lint BTPrint.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BTPrint'
  s.version          = '2.0.0'
  s.summary          = 'Swift 打印'


  s.homepage         = 'https://github.com/intsig171/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mccc' => 'mancong@bertadata.com' }
  s.source           = { :git => 'https://github.com/intsig171/BTPrint.git', :tag => s.version.to_s }

  s.platform              = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.swift_version         = '5.0'


  s.source_files = "BTPrint/Classes/**/*"

end
