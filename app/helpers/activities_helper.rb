module ActivitiesHelper
	def format_time_diff(diff)
		s = (diff % 60).to_i
		m = (((diff - s) / 60) % 60).to_i
		h = (((diff - s - m * 60) / (60 ** 2)) % 24).to_i
		d = (((diff - s - m * 60 - h * 60 ** 2) / (60**2 * 24))).to_i

    if d >= 1
      "#{d}日"
    elsif h >= 1
      "#{h}時間"
    elsif m >= 1
      "#{m}分"
    else
      "#{s}秒"
    end
	end
end
