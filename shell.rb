# -*- coding: utf-8 -*-
# encoding: UTF-8

Signal.trap(:HUP){}
Signal.trap(:INT){}
Signal.trap(:QUIT){}
Signal.trap(:TERM){}

require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "host"
    c.channels = ["#kmc-shell:*.jp"]
    c.port = 16660
    c.password = "pass"
    c.nick = "Shell"
    c.user = "Shell"
  end
  
  on :message, /^ ?\$(.*)$/ do |m|
    mat = /^ ?\$(.*)$/.match(m.message)
    command = mat[1]
    unless /ruby +.*shell.rb/ =~ command
      m.target.notice `#{command} 2>&1`
    end
  end

end

bot.start
