# frozen_string_literal: true

require 'securerandom'
require_relative '../errors/invalid_type_error'
require_relative '../errors/missing_value_error'

class AccountModel
  attr_reader :id, :name, :email, :password

  def initialize(name, email, password)
    @id = SecureRandom.uuid
    @name = name
    @email = email
    @password = password
    validate
  end

  private

  def validate
    raise InvalidTypeError.new('Name', 'String') unless name.is_a?(String)
    raise InvalidTypeError.new('Email', 'String') unless email.is_a?(String)
    raise InvalidTypeError.new('Password', 'String') unless password.is_a?(String)
    raise MissingValueError, 'Name' if name.empty?
    raise MissingValueError, 'Email' if email.empty?
    raise MissingValueError, 'Password' if password.empty?
  end
end
