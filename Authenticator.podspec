Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "Authenticator"
  s.version      = "0.0.1"
  s.summary      = "Utils for LocalAuthentication using Biometrics"
  s.description  = <<-DESC
  "Utils for Biometric scan"
                   DESC

  s.homepage     = "https://github.com/GeofriendTech/iOSUtils/"
  s.license      = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2023
                   Permission is granted to...
                  LICENSE
                }
  s.author             = { "Shashank Singh" => "shashanksingh485@gmail.com" }
  s.platform     = :ios, "12.0"
  s.ios.deployment_target = "12.0"
  s.swift_version = '5.0'
  s.source       = { :git => "https://github.com/GeofriendTech/iOSUtils.git", :tag => "#{s.version}" }

  s.source_files  = "Authenticator/Authenticator/*.{swift,h}", "Authenticator/LocalAuthentication/**/*.{swift,h}"
  # s.resources     = "Authenticator/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  # s.static_framework = true
end
