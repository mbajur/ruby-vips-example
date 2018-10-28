require 'rubygems'
require 'image_processing'

puts '---> Vips version:'
system 'vips --version'

puts '---> Downloading sample gif file'
system 'wget https://umaar.com/assets/images/dev-tips/screenshot-capture.gif'

puts '---> Extracting first frame'
ImageProcessing::Vips.source(File.open('screenshot-capture.gif'))
		 .loader(page: 1)
		 .convert('jpg')
		 .saver(background: 255, quality: 100)
		 .resize_to_limit!(100, 100)
