class Feature < ActiveRecord::Base
  
  named_scope :by_name, lambda { |name| { :conditions => [ "lower(name) = ?", name.downcase ] } }
  
  def to_param
    name.parameterize
  end
end
