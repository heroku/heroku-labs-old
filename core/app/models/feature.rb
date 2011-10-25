class Feature < ActiveRecord::Base
  validates_presence_of :name, :details, :documentation, :support, :flag
  before_save :ensure_case
  
  named_scope :by_name, lambda { |name| { :conditions => [ "lower(name) = ?", name.downcase ] } }
  named_scope :by_flag, lambda { |flag| { :conditions => [ "lower(flag) = ?", flag.downcase ] } }
  
  def to_param
    name.parameterize
  end
  
  private
  
  def ensure_case
    self.name.downcase!
    self.flag.downcase!
  end
end
