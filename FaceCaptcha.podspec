Pod::Spec.new do |spec|

  spec.name                = "FaceCaptcha"
  spec.version             = "4.0.6"
  spec.swift_version       = '4.2'
  spec.summary             = "Framework FaceCaptcha para iOS."
  spec.homepage            = "https://www.oititec.com.br/"
  spec.license             = { :type => "Copyright", :file => "LICENSE" }
  spec.author              = "Oiti"
  spec.platform            = :ios, "10.0"
  spec.source              = { :git => "https://github.com/oititec/liveness-ios-sdk.git", :tag => "#{spec.version}" }
  

  spec.vendored_frameworks = "Framework/FaceCaptcha.xcframework"

  spec.dependency "OILiveness3D_FT", "~> 9.6.10"

end
