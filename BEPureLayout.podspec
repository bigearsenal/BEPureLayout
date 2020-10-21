#
# Be sure to run `pod lib lint BEPureLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BEPureLayout'
  s.version          = '0.1.6'
  s.summary          = 'Useful extensions for UIViews using PureLayout'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Extend the ability of PureLayout by adding some UI classes, PureLayout-styled function and short-hand UIViews helpers'

  s.homepage         = 'https://github.com/bigearsenal/BEPureLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bigearsenal' => 'bigearsenal@gmail.com' }
  s.source           = { :git => 'https://github.com/bigearsenal/BEPureLayout.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bigearsenal'
  s.swift_version = '4.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'BEPureLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BEPureLayout' => ['BEPureLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'PureLayout'
end
