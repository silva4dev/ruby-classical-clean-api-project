# frozen_string_literal: true

require_relative "../../../../src/utils/email_validator/email_validator_adapter"

describe Utils::EmailValidator::EmailValidatorAdapter, type: :unit do
  it "Should return false if validator returns false" do
    sut = Utils::EmailValidator::EmailValidatorAdapter.new
    allow(sut).to receive(:is_valid?).and_return(false)
    expect(sut.is_valid?("incorrect_email@mail.com")).to eq(false)
  end

  it "Should return true if validator returns true" do
    sut = Utils::EmailValidator::EmailValidatorAdapter.new
    allow(sut).to receive(:is_valid?).and_return(true)
    expect(sut.is_valid?("valid_email@mail.com")).to eq(true)
  end

   it "Should call validator with correct email" do
    sut = Utils::EmailValidator::EmailValidatorAdapter.new
    allow(sut).to receive(:is_valid?).and_return(true)
    sut.is_valid?("any_email@mail.com")
    expect(sut).to have_received(:is_valid?).with("any_email@mail.com")
  end
end
