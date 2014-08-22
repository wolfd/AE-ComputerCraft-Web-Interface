class ItemSerializer < ActiveModel::Serializer
  attributes :id, :mc_id, :dmg, :qty, :name, :raw_name, :max_dmg
end