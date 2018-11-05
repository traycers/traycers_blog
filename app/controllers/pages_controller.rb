require 'betterlorem'

class PagesController < ApplicationController
  def home
  end

  def about
  end

  def project
    @ruby_files_quantity ||= 1
    @strings_quantity ||= 1
  end
end
