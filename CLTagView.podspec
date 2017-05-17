Pod::Spec.new do |s|

  s.name         = "CLTagView"
  s.version      = "1.0.0"
  s.summary      = "An easy way to create a tag view like WeChat"
  s.homepage     = "https://github.com/VamCriss/CLTagView"
  s.license      = 'MIT'
  s.author       = { "criss" => "ericluo0114@hotmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/VamCriss/CLTagView.git", :tag => s.version }
  s.source_files  = 'CLTagView/**/*.*'
  s.requires_arc = true

end
