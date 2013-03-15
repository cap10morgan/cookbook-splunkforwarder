actions :add, :remove

def initialize(*args)
  super
  @action = :add
end

attribute :file, :kind_of => String, :name_attribute => true
