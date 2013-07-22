require 'spec_helper'

class TestScreen
  include Mohawk
  window(:title => "Some Window Title")
  
  text(:text_id, :id => "textId")
end

describe Mohawk do
  let(:screen) { TestScreen.new }
  let(:window) { double('RAutomation Window') }

  it "uses the uia adapter by default" do
    RAutomation::Window.should_receive(:new).with(:title => "Some Window Title", :adapter => :ms_uia).and_return(window)
    TestScreen.new
  end

  it "can accept additional locator information" do
    RAutomation::Window.should_receive(:new).with(:title => "Some Window Title", :extra => 'test', :adapter => :ms_uia).and_return(window)
    TestScreen.new :extra => 'test'
  end

  context 'launching an application' do
    it 'requires a path' do
      lambda { Mohawk.start }.should raise_error(Mohawk::InvalidApplicationPath, 'You must set the Mohawk.app_path to start an application')
    end
  end

  context "using the UI Automation adapter" do
    before(:each) do
      RAutomation::Window.stub(:new).and_return(window)
      RAutomation::WaitHelper.stub(:sleep)
    end

    it "knows if a window exists" do
      window.should_receive(:exist?)
      screen.exist?
    end

    it "knows if a window is active or not" do
      window.should_receive(:active?)
      screen.active?
    end

    it "knows if the window is present" do
      window.should_receive(:present?)
      screen.present?
    end

    it "can hold off until the window is present" do
      window.should_receive(:wait_until_present)
      screen.wait_until_present
    end

    it "can hold off until I say so" do
      window.should_receive(:present?).twice.and_return(false, true)
      screen.wait_until {screen.present?}
    end

    it "can wait for a control" do
      found_control = double("control to wait for")
      found_control.should_receive(:exist?).and_return(true)
      window.should_receive(:control).with(:id => "whatever", :index => 0).and_return(found_control)
      screen.wait_for_control(:id => "whatever", :index => 0)
    end

    it "tells you what you were waiting for if it fails" do
      RAutomation::WaitHelper.should_receive(:wait_until).and_raise("you should have caught me")
      locator = {:id => "whatever", :index => 0}
      window.should_receive(:control).with(locator)
      lambda { screen.wait_for_control(:id => "whatever", :index => 0) }.should raise_error(Exception, "A control with #{locator} was not found")
    end

    it "knows if a window has text" do
      window.should_receive(:text).and_return("lots of text but I wanted to find blardy blar blar")
      screen.should have_text "blardy blar"
    end
    
  end
end
