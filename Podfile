platform :ios, '11.0'

target 'Lexicon' do
  use_frameworks!
  inhibit_all_warnings!

  pod 'RxCocoa'
  pod 'RxSwift'

  target 'LexiconTests' do
    inherit! :search_paths
    pod 'RxTest'
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end
