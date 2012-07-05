##window下需要这段代码才能正常上传图片
#Paperclip.options[:command_path] = "D:/ImageMagick-6.5.3-Q8"
#Paperclip.options[:swallow_stderr] = false
#if RUBY_PLATFORM == 'i386-mingw32'
#  module Paperclip
#    def self.quote_command_options(*options)
#      options.map do |option|
#        option.split("\"").map{|m| "\"#{m}\"" }.join("\\\"")
#      end
#    end
#  end
#end
#
