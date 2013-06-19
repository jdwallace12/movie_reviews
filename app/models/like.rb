class Like < ActiveRecord::Base
  attr_accessible :user, :likable

  validates :user, :likable,  {
    presence: true
  }

  belongs_to :likable, :polymorphic => true

  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:likable_id, :likable_type]

end
