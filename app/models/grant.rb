class Grant < ActiveRecord::Base
  belongs_to :role
  belongs_to :right
end
