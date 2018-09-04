#
# Be sure to run `pod lib lint BlinkingLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BlinkingLabel'
  s.version          = '0.1.0'
  s.summary          = 'A subclass on UILabel that provides a blink'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This CocoaPod provides the ability to use a UILabel that may be started and stopped blinking.
                       DESC

  s.homepage         = 'https://github.com/ganeshsourcebits/BlinkingLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ganeshsourcebits' => 'ganesh.kumar@sourcebits.com' }
  s.source           = { :git => 'https://github.com/ganeshsourcebits/BlinkingLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version    = '4.0'

  s.ios.deployment_target = '9.0'

  s.source_files = 'BlinkingLabel/Classes/**/*'
  
  s.static_framework = true

  # s.resource_bundles = {
  #   'BlinkingLabel' => ['BlinkingLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency "TwitterKit"
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKLoginKit'
  # s.dependency 'Google/SignIn'
  s.dependency 'GoogleSignIn'
end
