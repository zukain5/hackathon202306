class Activity < ApplicationRecord
  has_many :activity_histories, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def latest_history_datetime
    activity_histories.order(acted_at: :desc).first&.acted_at
  end

  def passed_time
    return -1 if latest_history_datetime.nil?

    Time.current - latest_history_datetime
  end

  class << self
    def all_asc_by_passed_time
      ActivityHistory
        .group(:activity_id)
        .maximum(:acted_at) # {id: acted_at} のハッシュが返る
        .sort_by {|_, v| v } # acted_at でソート
        .reverse
        .map(&:first) # idのみ取り出す
        .map {|id| Activity.find(id) }
    end
  end
end
