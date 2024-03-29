class Note < ActiveRecord::Base
  validates :track_id, :user_id, presence: :true

  belongs_to :track
  belongs_to :user
end