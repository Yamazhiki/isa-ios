project 'isa-ios.xcodeproj'

use_frameworks!
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
inhibit_all_warnings!

target 'Api' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for Api
  pod 'Moya'
  pod 'Moya/RxSwift'
  target 'ApiTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'App' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kickstarter-Prelude'
  pod 'RxDataSources'
  target 'AppTests' do
    pod 'Moya'
    pod 'Moya/RxSwift'
    pod 'RxTest'
    inherit! :search_paths
    # Pods for testing
  end

  target 'AppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
end
