class PagesController < ApplicationController
  def home
    @posts = Post.limit(5).order("RANDOM()")
  end

  def about
  end

  def project
    @ruby_files_quantity ||= 1
    @strings_quantity ||= 1
  end
end
