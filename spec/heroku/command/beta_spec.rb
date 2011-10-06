require "spec_helper"
require "heroku/command/beta"

module Heroku::Command
  describe Beta do
    before do
      @beta = prepare_command(Domains)
      @beta.heroku.stub!(:info).and_return({})
    end
    
    it "lists no beta addons if developer is not enrolled" do
      @beta.heroku.should_receive(:list_beta_addons).with('myapp').and_return([])
      @beta.index
    end

    it "lists beta addons if developer enrolled" do
      @beta.heroku.should_receive(:list_beta_addons).with('myapp')
      @beta.index
    end
    
    it "displays details of a beta addon" do
      @beta.stub!(:args).and_return(['example'])
      @beta.heroku.should_receive(:get_beta_addon).with('example')
      @beta.info
    end
    
    it "shows usage if no addon name specified for info" do
      @beta.stub!(:args).and_return([])
      lambda { @beta.info }.should raise_error(CommandFailed, /Usage:/)
    end
    
    it "enables a beta addon" do
      @beta.stub!(:args).and_return(['example'])
      @beta.heroku.should_receive(:enable_beta_addon).with('myapp', 'example')
      @beta.enable
    end
    
    it "shows usage if no addon name specified for enable" do
      @beta.stub!(:args).and_return([])
      lambda { @beta.enable }.should raise_error(CommandFailed, /Usage:/)
    end
    
    it "disables a beta addon" do
      @beta.stub!(:args).and_return(['example'])
      @beta.heroku.should_receive(:disable_beta_addon).with('myapp', 'example')
      @beta.disable
    end
    
    it "shows usage if no addon name specified for disable" do
      @beta.stub!(:args).and_return([])
      lambda { @beta.disable }.should raise_error(CommandFailed, /Usage:/)
    end
  end
end