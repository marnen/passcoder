# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
controller_path = File.join Rails.root, 'app', 'controllers'
Rails.application.config.assets.precompile += Pathname.glob(File.join(controller_path, '**', '*_controller.rb')).collect do |controller|
  controller_name = controller.relative_path_from(Pathname.new controller_path).to_s.chomp('_controller.rb')
  ['.css', '.js'].collect {|suffix| [controller_name, suffix].join }
end.flatten
