Pod::Spec.new do |s|
  s.name             = "Juncture"
  s.version          = "0.1.0"
  s.summary          = "Juncture: A place where things (Storyboards) join"
  s.description      = <<-DESC
                       Juncture is a set of category and classes to make easier the navigation
                       between several storyboards and the pass of data between view controllers
                       in the storyboards.
                       
                       DESC
  s.homepage         = "https://github.com/nextorlg/juncture"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Nestor Lafon-Gracia" => "nestor.lafon@gmail.com" }
  s.source           = { :git => "https://github.com/nextorlg/Juncture.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nestorlafon'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  #s.resource_bundles = {
  #  'Juncture' => ['Pod/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
