require 'spec_helper'

describe "Static pages" do

  subject { page } # implicitly sets the subject for test, this way prevent the need for 
                  # explicitly writing page.should for each test
  describe "Home page" do

    before { visit root_path } # this before block says to check this route first before testing
    # anything further. saves the need to explicity say to visit root_path for each condition below
      it { should have_selector('h1', :text => 'Sample App') } 
      it { should have_selector('title', :text => full_title('') ) } 
      # the about full_title() call is being made to RSpec helper located spec/support/utilities.rb
      it { should_not have_selector('title', :text => '| Home') }
    #end
  end

  describe "Help page" do
    before { visit help_path }
  	   it { should have_selector('h1', :text => 'Help') }
       it { should have_selector('title', :text => full_title('Help') ) }
  end

  describe "About page" do
    before { visit about_path }
  	it { should have_selector('h1', :text => 'About') }
    it { should have_selector('title', :text => full_title('About Us') ) }  
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', :text => 'Contact') }
    it { should have_selector('title', :text => full_title('Contact') ) }
  end

  #describe "Contact page" do
  #  it "should have content 'Contact'" do
  #    visit contact_path
  #    page.should have_selector('h1', :text => 'Contact')
  #  end

  #  it "should have content 'Contact'" do
  #    visit contact_path
  #    page.should have_selector('title', :text=>
  #      "Ruby on Rails Tutorial Sample App | Contact")
  #  end


end