# frozen_string_literal: true

class AvatarValidator < ActiveModel::Validator
  def validate(record)
    @avatar = record.avatar
    @errors = record.errors

    return unless @avatar.attached?

    check_size
    check_format
  end

  def check_size
    return if @avatar.blob.byte_size <= 0.5.megabyte

    @errors.add(:avatar, 'is too big')
  end

  def check_format
    acceptable_types = ['image/jpeg', 'image/png', 'image/svg+xml']
    return if acceptable_types.include?(@avatar.content_type)

    @errors.add(:avatar, 'must be a JPEG or PNG')
  end
end
