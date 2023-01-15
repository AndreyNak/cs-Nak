# frozen_string_literal: true

module ApplicationHelper
  def load_svg(path)
    p "+=" * 20
    p __dir__
    File.open("app/assets/images/svg/#{path}", 'rb') do |file|
      raw(file.read)
    end
  rescue Errno::ENOENT
    nil
  end
end
