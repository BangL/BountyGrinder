local _layout_bounty_mission_label_original = RaidGUIControlListItemRaids._layout_bounty_mission_label

function RaidGUIControlListItemRaids:_layout_bounty_mission_label(...)
    _layout_bounty_mission_label_original(self, ...)

    if self._item_label and managers.raid_job and managers.raid_job:daily_bounty_completed(true) and not self._data.custom_bounty then
        self._completed_label = self._object:label({
            vertical = "center",
            fit_text = true,
            name = "list_item_completed_label_" .. self._name,
            text = managers.localization:to_upper_text("endless_bounties_already_completed"),
            font = tweak_data.gui.fonts.din_compressed,
            font_size = tweak_data.gui.font_sizes.extra_small,
            color = tweak_data.gui.colors.raid_grey
        })
        self._completed_label:set_right(self._item_label:w() - RaidGUIControlListItemRaids.ICON_PADDING)
        self._completed_label:set_center_y(RaidGUIControlListItemRaids.NAME_CENTER_Y)
    end
end
