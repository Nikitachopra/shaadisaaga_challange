class UsersNews < ApplicationRecord
  belongs_to :user
  belongs_to :news

  enum status: [:read, :removed]

  #Scopes
  scope :removed_news, -> {where(status: "removed")}
  scope :read_news, -> {where(status: "read")}
end
