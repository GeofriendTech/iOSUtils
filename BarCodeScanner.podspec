Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "BarCodeScanner"
  s.version      = "0.0.1"
  s.summary      = "Utils for BarCode scan"
  s.description  = <<-DESC
  "Utils for BarCode scan"
                   DESC

  s.homepage     = "https://github.com/GeofriendTech/iOSUtils/tree/main/App"
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

  s.source_files  = "BarCodeScanner/BarCodeScanner/*.{swift,h}", "BarCodeScanner/BarCodeScanner/**/*.{swift,h}"
  s.resources     = "BarCodeScanner/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  s.static_framework = true
end