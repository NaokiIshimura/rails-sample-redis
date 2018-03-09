class HomeController < ApplicationController
  def index
    puts '>>> test'
    session[:hoge] = 'huga'
    p session[:hoge]
    
    session[:test] = 'aaa'
    p session[:test]
    
    p request.session_options[:id]
  end
end
