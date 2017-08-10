class Comment < ApplicationRecord
    belongs_to :user
    # belongs_to :game
    # validates :comment, length: {minimum: 1}
end
