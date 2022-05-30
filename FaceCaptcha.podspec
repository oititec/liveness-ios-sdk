
Pod::Spec.new do |spec|

  spec.name                 = "FaceCaptcha"
  spec.version              = "5.0.0-beta3"
  spec.summary              = "Framework FaceCaptcha para iOS."
  spec.homepage             = "https://www.oititec.com.br/"
  spec.license              = { :type => "Copyright", :file => "LICENSE" }
  spec.author               = "Oiti"
  spec.platform             = :ios, "9.0"
  spec.source               = { :git => "https://github.com/oititec/liveness-ios-sdk.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks  = "Framework/FaceCaptcha.xcframework"
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.pod_target_xcconfig  = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
