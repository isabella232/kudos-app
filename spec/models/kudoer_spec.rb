require 'spec_helper'

describe Kudoer do

  before do
    @kudoer = Kudoer.new(email: "lukasz@sml.com", first_name: "Lukasz", last_name: "Lenart",
                            password: "testtest", password_confirmation: "testtest")
  end

  subject { @kudoer }

  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }

  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should respond_to(:authenticate) }

  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "when email is not present" do
    before { @kudoer.email = " " }
    it { should_not be_valid }
  end

  describe "when first_name is not present" do
    before { @kudoer.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last_name is not present" do
    before { @kudoer.last_name = " " }
    it { should_not be_valid }
  end

  describe "remember token" do
    before { @kudoer.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "when password is not present" do
    before do
      @kudoer = Kudoer.new(email: "user@example.com", first_name: "Lukasz", last_name: "Lenart",
                          password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @kudoer.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @kudoer.save }
    let(:found_kudoer) { Kudoer.find_by(email: @kudoer.email) }

    describe "with valid password" do
      it { should eq found_kudoer.authenticate(@kudoer.password) }
    end

    describe "with invalid password" do
      let(:kudoer_for_invalid_password) { found_kudoer.authenticate("invalid") }

      it { should_not eq kudoer_for_invalid_password }
      specify { expect(kudoer_for_invalid_password).to be_false }
    end
  end

  describe "with a password that's too short" do
    before { @kudoer.password = @kudoer.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

end
