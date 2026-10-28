MRuby::Gem::Specification.new("picoruby-etc") do |spec|
  spec.license = 'MIT'
  spec.author = 'robert@r.uby.dev'
  spec.summary = 'picoruby + etc = picoruby-etc'
  spec.version = "0.1.0"

  if build.picoruby?
    spec.require_name = "etc"
  end

  spec.cc.flags << '-Wall'
  spec.cc.flags << '-Wpedantic'
end
