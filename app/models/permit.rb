class Permit
  def initialize
  end

  # default empty access method
  def access ability
  end

  def self.retrieve_for role
    Permit::Registry.instance.retrieve(role)
  end

  def self.create role, &block
    permit = define_method(:access) do |ability|
      # http://rubylearning.com/blog/2010/11/30/how-do-i-build-dsls-with-yield-and-instance_eval/
      # Having AND eating the cake :)
      if block_given?
        if block.arity == 1
          yield ability
        else
          ability.instance_eval &block
        end
      end
    end
    Permit::Registry.instance.register role, permit
    permit
  end
end
