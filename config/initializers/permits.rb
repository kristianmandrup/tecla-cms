blocks = [Cms::Block, Cms::Image, Cms::List]

Permit.create(:super_admin) do
  can :manage, :all
end

Permit.create(:admin) do
  cannot :manage, User
  can :manage, blocks
end

Permit.create(:publisher) do
  cannot :manage, User
  can [:manage, :accept, :reject], blocks
end

# stage means stage for review by publisher
Permit.create(:author) do
  cannot :manage, User
  can [:create, :edit, :add, :stage], blocks
end

Permit.create(:default) do
  cannot :manage, User
  can [:read, :edit], blocks
end
