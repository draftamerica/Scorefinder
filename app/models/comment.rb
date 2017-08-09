class Comment < ApplicationRecord
    belongs_to :user
    # validates :comment, length: {minimum: 1}
end
