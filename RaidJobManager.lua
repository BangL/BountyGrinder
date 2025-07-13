local daily_bounty_completed_original = RaidJobManager.daily_bounty_completed or RaidJobManager.is_bounty_completed

-- tricks the game into always getting false, as it never passes any param while calling this func.
-- however, we can still bring it back to life, if we really mean it (by passing for_real = true).
function RaidJobManager:daily_bounty_completed(for_real)
	return for_real and daily_bounty_completed_original(self)
end

-- U25.0 & U25.1 compat
if RaidJobManager.is_bounty_completed then
	function RaidJobManager:is_bounty_completed(for_real)
		return self:daily_bounty_completed(for_real)
	end
end
