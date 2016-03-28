Pod::Spec.new do |s|
    s.name             = "PopView"
    s.version          = '1.0.1'
    s.summary          = "这个一个悬浮在View上层的VIew，起到提示作用!"
    s.description      = "这是一个简单实用的popView."
    s.homepage         = "https://github.com/shiwensong/SWSPopView"
    s.license          = 'MIT'
    s.author           = { 'Javier Soto' => 'ios@javisoto.es' }
    s.source           = { :git => 'https://github.com/shiwensong/SWSPopView.git', :tag => s.version }

    s.platform     = :ios
    s.requires_arc = true

    s.source_files = 'PopView/**/*'
    #s.resource_bundles = {
    #'JSBadgeView' => ['Pod/Assets/*.png']
    #}

    s.frameworks = 'QuartzCore'
end