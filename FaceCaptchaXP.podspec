
Pod::Spec.new do |spec|

  spec.name                = "FaceCaptchaXP"
  spec.version             = "1.1.0"
  spec.summary             = "Framework FaceCaptcha para iOS customizado para XP."
  spec.homepage            = "https://www.oititec.com.br/"
  spec.license             = { :type => "Copyright", :file => "LICENSE" }
  spec.author              = "Oiti"
  spec.platform            = :ios, "9.0"
  spec.source              = { :git => "https://github.com/oititec/liveness-ios-sdk.git", :tag => "#{spec.version}" }
  spec.source_files        = "Framework/XP/FaceCaptcha.framework/Headers/*.h"
  spec.public_header_files = "Framework/XP/FaceCaptcha.framework/Headers/*.h"
  spec.vendored_frameworks = "Framework/XP/FaceCaptcha.framework"

end
