local ToggleButton = ZO_Object:Subclass()
AwesomeGuildStore.ToggleButton = ToggleButton

function ToggleButton:New(parent, name, textureName, x, y, width, height, tooltipText)
	local button = ZO_Object.New(self)
	button.pressed = false
	button.locked = false

	local control = parent:CreateControl(name, CT_BUTTON)
	control:SetNormalTexture(textureName:format("up"))
	control:SetPressedTexture(textureName:format("down"))
	control:SetMouseOverTexture(textureName:format("over"))
	control:SetClickSound("Click")
	control:SetHidden(false)
	control:SetDimensions(width, height)
	control:SetAnchor(TOPLEFT, parent, TOPLEFT, x, y)
	control:SetHandler("OnMouseUp", function(control, button, isInside)
		if(button == 1 and isInside) then
			control.parent:Toggle(false)
		end
	end)
	if(tooltipText) then
		control:SetHandler("OnMouseEnter", function()
			InitializeTooltip(InformationTooltip)
			InformationTooltip:ClearAnchors()
			InformationTooltip:SetOwner(control, BOTTOM, 5, 0)
			SetTooltipText(InformationTooltip, tooltipText)
		end)
		control:SetHandler("OnMouseExit", function()
			ClearTooltip(InformationTooltip)
		end)
	end
	control.parent = button
	button.control = control

	return button
end

function ToggleButton:Toggle(fromGroup)
	if(self:IsPressed()) then
		self:Release(fromGroup)
	else
		self:Press(fromGroup)
	end
end

function ToggleButton:Press(fromGroup)
	if(self:IsLocked() or self:IsPressed() or not self:HandlePress(fromGroup)) then return end
	self.control:SetState(BSTATE_PRESSED, true)
	self.pressed = true
	if(self.group) then self.group:IncrementPressedButtonCount() end
end

function ToggleButton:HandlePress(fromGroup)
	-- overwrite this
	return true
end

function ToggleButton:Release(fromGroup)
	if(self:IsLocked() or not self:IsPressed() or not self:HandleRelease(fromGroup)) then return end
	self.control:SetState(BSTATE_NORMAL, true)
	self.pressed = false
	if(self.group) then self.group:DecrementPressedButtonCount() end
end

function ToggleButton:HandleRelease(fromGroup)
	-- overwrite this
	return true
end

function ToggleButton:IsPressed()
	return self.pressed
end

function ToggleButton:Lock(fromGroup)
	if(self:IsLocked() or not self:HandleLock(fromGroup)) then return end
	self.control:SetState(self:IsPressed() and BSTATE_DISABLED_PRESSED or BSTATE_DISABLED)
	self.locked = true
end

function ToggleButton:HandleLock(fromGroup)
	-- overwrite this
	return true
end

function ToggleButton:Unlock(fromGroup)
	if(not self:IsLocked() or not self:HandleUnlock(fromGroup)) then return end
	self.control:SetState(self:IsPressed() and BSTATE_PRESSED or BSTATE_NORMAL)
	self.locked = false
end

function ToggleButton:HandleUnlock(fromGroup)
	-- overwrite this
	return true
end

function ToggleButton:IsLocked()
	return self.locked
end
