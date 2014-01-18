Pod::Spec.new do |s|
  s.name         = "LKUserDefaults"
  s.version      = "1.0.0"
  s.summary      = "NSUserDefaults wrapper"
  s.description  = <<-DESC
Properties can be used for accessing NSUserDefaults's values.
                   DESC
  s.homepage     = "https://github.com/lakesoft/LKUserDefaults"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroshi Hashiguchi" => "xcatsan@mac.com" }
  s.source       = { :git => "https://github.com/lakesoft/LKUserDefaults.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

end
