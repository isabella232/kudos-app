require 'spec_helper'

describe "Kudoer pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }
  end

  describe "profile page" do
    let(:kudoer) { FactoryGirl.create(:kudoer) }
    before { visit kudoer_path(kudoer) }

    it { should have_content(kudoer.first_name) }
    it { should have_content(kudoer.last_name) }
    it { should have_title(kudoer.first_name + ' ' + kudoer.last_name) }
  end

end
