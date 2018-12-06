Pod::Spec.new do |s|
s.name         = "Tools-Swift"
s.version      = "1.0.1"
s.summary      = "各种系统类的swift扩展函数、安全函数封装以及使用工具封装。"
s.homepage     = "https://github.com/wsj2012/Tools-Swift"
s.license      = "MIT"
s.author       = { "wsj_2012" => "time_now@yeah.net" }
s.source       = { :git => "https://github.com/wsj2012/Tools-Swift.git", :tag => "#{s.version}" }
s.requires_arc = true
s.ios.deployment_target = "9.0"
s.source_files  = "Tools/*.{swift}"
s.swift_version = '4.0'

end
