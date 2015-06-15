#
# Be sure to run `pod lib lint DSLibCore.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DSLibCore"
  s.version          = "1.2.0"
  s.summary          = "A set of usefull classes"
  s.description      = <<-DESC
A set of usefull classes. A description to be written.
                       DESC
  s.homepage         = "https://github.com/diejmon/DSLibCore"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Alexander Belyavskiy" => "diejmon@gmail.com" }
  s.source           = { :git => "https://github.com/diejmon/DSLibCore.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/diejmon'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'no-arc' do |sp|
    sp.source_files = 'Pod/Classes/no-arc/*'
    sp.requires_arc = false
  end

  s.subspec 'Core' do |sp|
  	sp.dependency 'DSLibCore/no-arc'
    sp.source_files = 'Pod/Classes/*.{h,m,swift}'
    sp.resource_bundles = {
    'DSLibCore' => ['Pod/Assets/*.png']
    }
  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
