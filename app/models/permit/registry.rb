class Permit::Registry
  include Singleton

  attr_accessor :store

  def initialize
    @store = {}
  end

  def retrieve role
    store[role]
  end

  def register role, permit
    store[role.to_sym] = permit
    permit
  end

  def unregister role
    store[role.to_sym] = nil
    permit
  end

end
