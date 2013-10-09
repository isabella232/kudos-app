require 'spec_helper'

describe "/" do

  it "should have the content 'Well Done Kudos!'" do
    visit root_path
    expect(page).to have_title('Kudos | Welcome!')
    expect(page).to have_content('Well Done Kudos')
  end

end
