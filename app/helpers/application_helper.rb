# frozen_string_literal: true

module ApplicationHelper
  def load_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      raw(file.read)
    end
  end
end
