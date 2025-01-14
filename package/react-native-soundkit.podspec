require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::UI.puts "[react-native-soundkit] Thank you for using react-native-soundkit 🎵"
Pod::UI.puts "[react-native-soundkit] If you enjoy using react-native-soundkit, please consider supporting the project: https://github.com/mikalaiulasevich/react-native-soundkit"

Pod::Spec.new do |s|
  s.name         = "react-native-soundkit"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => min_ios_version_supported, :tvos => "12.0", :osx => "10.14" }
  s.source       = { :git => "https://github.com/mikalaiulasevich/react-native-soundkit.git", :tag => "#{s.version}" }

  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    "CLANG_CXX_LIBRARY" => "libc++",
    "CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF" => "NO",
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) FORCE_POSIX",
  }
  s.compiler_flags = '-x objective-c++'

  s.source_files = [
    # react-native-soundkit
    "ios/**/*.{h,m,mm}",
    "cpp/**/*.{hpp,cpp,c,h}",
  ]

  install_modules_dependencies(s)
end