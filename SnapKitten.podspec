#
# Be sure to run `pod lib lint SnapKitten.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SnapKitten'
  s.version          = '0.1.12'
  s.summary          = 'A library based on SnapKit and Constraint system. It try to simplify the linear case of UI Constraint'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A library based on SnapKit and Constraint system. It try to simplify the linear case of UI Constraint
  Future would create a android equalivalent.
                       DESC

  s.homepage         = 'https://github.com/springwong/SnapKitten'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Spring Wong' => 'rudolphwong2002@gmail.com' }
  s.source           = { :git => 'https://github.com/springwong/SnapKitten.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SnapKitten/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SnapKitten' => ['SnapKitten/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit', '~> 3.2.0'
end
