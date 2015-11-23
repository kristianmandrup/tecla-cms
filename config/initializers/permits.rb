 blocks = [Cms::Models::Block, Cms::Models::Image, Cms::Models::Component,
  Cms::Models::Block::List]

Permit.create(:super_admin) do
  can :manage, :all
end

Permit.create(:admin) do
  cannot :manage, Cms::User
  can :manage, blocks
end

Permit.create(:publisher) do
  cannot :manage, Cms::User
  can [:manage, :accept, :reject], blocks
end

# stage means stage for review by publisher
Permit.create(:author) do
  cannot :manage, Cms::User
  can [:create, :update, :add, :stage], blocks
end

Permit.create(:default) do
  cannot :manage, Cms::User
  can [:read], blocks
end
