# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @modes = Mode.all
  end
end
