module ActivitiesHelper
	def format_time_diff(diff)
		s = diff % 60
		m = ((diff - s) / 60) % 60
		h = ((diff - s - m * 60) / (60 ** 2)) % 24
		d = ((diff - s - m * 60 - h * 60 ** 2) / (60**2 * 24))
		"#{d.to_i}日 #{h.to_i}時間#{m.to_i}分#{s.to_i}秒"
	end
end
