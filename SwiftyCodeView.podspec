#
# Be sure to run `pod lib lint SwiftyCodeView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
 s.swift_version     = '4.1'
  s.name             = 'SwiftyCodeView'
  s.version          = '0.3.3'
  s.summary          = 'An UI Component for verification codes written in swift'

  s.description      = <<-DESC
  A customizable verification code UI Component. Can be used for phone verification codes, passwords etc.
                       DESC

  s.homepage         = 'https://github.com/arturdev/SwiftyCodeView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'arturdev' => 'mkrtarturdev@gmail.com' }
  s.source           = { :git => 'https://github.com/arturdev/SwiftyCodeView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.3'
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files = 'SwiftyCodeView/Classes/SwiftyCodeView/*'
    ss.frameworks = 'UIKit'
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "SwiftyCodeView/Classes/RxSwiftyCodeView/*"
    ss.dependency "SwiftyCodeView/Core"
    ss.dependency "RxSwift"
    ss.dependency "RxCocoa"
  end

end
