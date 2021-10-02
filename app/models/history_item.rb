class HistoryItem < ApplicationRecord
  belongs_to :menu
  belongs_to :history
  attribute :checked, :boolean, default: false
  after_create_commit { HistoryItemBroadcastJob.perform_later self }
  after_save_commit :job, if: :order_checked?
  private
    def job
      CheckedBroadcastJob.perform_later self
    end
    
    def order_checked?
      self.saved_change_to_checked?
    end
end
