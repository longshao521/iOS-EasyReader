Pod::Spec.new do |s|
  s.name         = "CLDCommon"
  s.version      = "0.0.1"
  s.summary      = "Cloudspace common libraries."
  s.homepage     = "https://github.com/cloudspace/CLDCommon.git"
  s.license      = "MIT"
  s.author       = { "Joseph Lorich" => "joey@cloudspace.com" }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/cloudspace/CLDCommon.git", :tag => s.version.to_s }
  s.source_files  = "CLDCommon", "CLDCommon/**/*.{h,m}"
  s.requires_arc = true

  s.dependency 'Block-KVO', '~> 2.2.1'
end