class HistoryItem < ApplicationRecord
  belongs_to :menu
  belongs_to :history
  after_create_commit { HistoryItemBroadcastJob.perform_later self }
end
