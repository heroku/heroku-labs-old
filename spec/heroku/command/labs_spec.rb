require "spec_helper"
require "heroku/command/labs"

module Heroku::Command
  describe Labs do
    before do
      @labs = prepare_command(Domains)
      @labs.heroku.stub!(:info).and_return({})
    end
    
    it "lists no experimental addons if developer is not enrolled" do
      @labs.heroku.should_receive(:list_experimental_addons).with('myapp').and_return([])
      @labs.index
    end

    it "lists experimental addons if developer enrolled" do
      @labs.heroku.should_receive(:list_experimental_addons).with('myapp')
      @labs.index
    end
    
    it "displays details of an experimental addon" do
      @labs.stub!(:args).and_return(['example'])
      @labs.heroku.should_receive(:get_experimental_addon).with('example')
      @labs.info
    end
    
    it "shows usage if no addon name specified for info" do
      @labs.stub!(:args).and_return([])
      lambda { @labs.info }.should raise_error(CommandFailed, /Usage:/)
    end
    
    it "enables an experimental addon" do
      @labs.stub!(:args).and_return(['example'])
      @labs.heroku.should_receive(:enable_experimental_addon).with('myapp', 'example')
      @labs.enable
    end
    
    it "shows usage if no addon name specified for enable" do
      @labs.stub!(:args).and_return([])
      lambda { @labs.enable }.should raise_error(CommandFailed, /Usage:/)
    end
    
    it "disables an experimental addon" do
      @labs.stub!(:args).and_return(['example'])
      @labs.heroku.should_receive(:disable_experimental_addon).with('myapp', 'example')
      @labs.disable
    end
    
    it "shows usage if no addon name specified for disable" do
      @labs.stub!(:args).and_return([])
      lambda { @labs.disable }.should raise_error(CommandFailed, /Usage:/)
    end
  end
end