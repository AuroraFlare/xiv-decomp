-- Helpers for scenario quest scripts recovered from client decomp.

local helpers = {};

local MAN_SNPC_PREVIEW_SCENES = {
	[110013] = {
		[1] = "man20150",
		[2] = "man20140",
	},
	[110014] = {
		[1] = "man20602",
		[2] = "man20603",
		[3] = "man20630",
	},
	[110015] = {
		[1] = "man30020",
		[2] = "man30030",
		[3] = "man30040",
	},
	[110016] = {
		[1] = "man30400",
		[2] = "man30410",
		[3] = "man30420",
		[4] = "man30430",
	},
	[110017] = {
		[1] = "man30800",
		[2] = "man30810",
		[3] = "man30830",
		[4] = "man40640",
		[5] = "man30850",
		[6] = "man30860",
		[7] = "man30880",
		[8] = "man30890",
		[9] = "man30900",
	},
	[110018] = {
		[1] = "man40200",
		[2] = "man40210",
		[3] = "man40220",
		[4] = "man40230",
	},
	[110019] = {
		[1] = "man40600",
		[2] = "man40610",
		[3] = "man40615",
		[4] = "man40630",
		[5] = "man40635",
		[6] = "man40640",
		[7] = "man40650",
	},
	[110020] = {
		[1] = "man50250",
	},
};

local MAN_SNPC_PREVIEW_HQ_SCENES = {
	man40635 = true,
	man40640 = true,
	man50250 = true,
};

local MAN_REFERENCE_ONLY_QUESTS = {
	[110020] = {
		code = "man502",
		title = "Scenario: Man502",
		textSheetId = 1648,
		recoveredScenario = "quest/scenario/man/man502",
		recoveredMethods = {
			"Man502.initText",
		},
		recoveredDirectors = {
			"QuestDirectorMan50201",
			"QuestDirectorMan50202",
		},
	},
	[110021] = {
		code = "man504",
		title = "Scenario: Man504",
		textSheetId = 1661,
		recoveredScenario = "quest/scenario/man/man504",
		recoveredMethods = {
			"Man504.initText",
		},
		recoveredDirectors = {},
	},
};

local MAN304_PE30_PERSONALITY_ROWS = {
	[1] = {369, 378},
	[2] = {370, 379},
	[3] = {371, 380},
	[4] = {372, 381},
	[5] = {373, 382},
	[6] = {374, 383},
	[7] = {376, 385},
	[8] = {375, 384},
	[9] = {377, 386},
};

local MAN308_PES_OPENING_ROWS = {
	[1] = {330, 339, 348},
	[2] = {331, 340, 349},
	[3] = {332, 341, 350},
	[4] = {333, 342, 351},
	[5] = {334, 343, 352},
	[6] = {335, 344, 353},
	[7] = {337, 346, 355},
	[8] = {336, 345, 354},
	[9] = {338, 347, 356},
};

local MAN308_ACCEPTED_ROWS = {
	[1] = {357, 366, 375},
	[2] = {358, 367, 376},
	[3] = {359, 368, 377},
	[4] = {360, 369, 378},
	[5] = {361, 370, 379},
	[6] = {362, 371, 380},
	[7] = {364, 373, 382},
	[8] = {363, 372, 381},
	[9] = {365, 374, 383},
};

local MAN308_PE20_PERSONALITY_ROWS = {
	[1] = 624,
	[2] = 625,
	[3] = 626,
	[4] = 627,
	[5] = 628,
	[6] = 629,
	[7] = 631,
	[8] = 630,
	[9] = 632,
};

local MAN406_PE01_PERSONALITY_ROWS = {
	[1] = 361,
	[2] = 362,
	[3] = 363,
	[4] = 364,
	[5] = 365,
	[6] = 366,
	[7] = 368,
	[8] = 367,
	[9] = 369,
};

local MAN406_PE52_PERSONALITY_ROWS = {
	[1] = 347,
	[2] = 348,
	[3] = 349,
	[4] = 350,
	[5] = 351,
	[6] = 352,
	[7] = 354,
	[8] = 353,
	[9] = 355,
};

local function getDefault(defaultValue)
	if (defaultValue ~= nil) then
		return defaultValue;
	end

	return 0;
end

local function getPlayerValue(player, getter, defaultValue)
	if (player == nil) then
		return getDefault(defaultValue);
	end

	local ok, value = pcall(getter, player);
	if (ok and value ~= nil) then
		return value;
	end

	return getDefault(defaultValue);
end

local function appendValue(values, value)
	if (value == nil) then
		return;
	end

	if (type(value) == "table") then
		for _, childValue in ipairs(value) do
			appendValue(values, childValue);
		end
	else
		values[#values + 1] = value;
	end
end

local function copyArray(values)
	local copy = {};
	for index, value in ipairs(values or {}) do
		copy[index] = value;
	end

	return copy;
end

function helpers.appendArgs(values, ...)
	local args = values or {};

	for index = 1, select("#", ...) do
		appendValue(args, select(index, ...));
	end

	return args;
end

function helpers.buildArgList(...)
	return helpers.appendArgs({}, ...);
end

function helpers.getQuestId(quest, defaultValue)
	local questId = tonumber(quest);
	if (questId ~= nil) then
		return questId;
	end

	if (quest == nil) then
		return defaultValue;
	end

	local ok, value = pcall(function()
		return quest:GetQuestId();
	end);

	if (ok and value ~= nil) then
		return value;
	end

	return defaultValue;
end

function helpers.getReferenceOnlyQuestMetadata(quest, defaultValue)
	local questId = helpers.getQuestId(quest, nil);

	return MAN_REFERENCE_ONLY_QUESTS[questId] or defaultValue;
end

function helpers.isReferenceOnlyQuest(quest)
	return helpers.getReferenceOnlyQuestMetadata(quest, nil) ~= nil;
end

function helpers.getReferenceOnlyTextSheetId(quest, defaultValue)
	local metadata = helpers.getReferenceOnlyQuestMetadata(quest, nil);
	if (metadata ~= nil and metadata.textSheetId ~= nil) then
		return metadata.textSheetId;
	end

	return defaultValue;
end

function helpers.getReferenceOnlyRecoveredScenario(quest, defaultValue)
	local metadata = helpers.getReferenceOnlyQuestMetadata(quest, nil);
	if (metadata ~= nil and metadata.recoveredScenario ~= nil) then
		return metadata.recoveredScenario;
	end

	return defaultValue;
end

function helpers.getReferenceOnlyRecoveredMethods(quest)
	local metadata = helpers.getReferenceOnlyQuestMetadata(quest, nil);
	if (metadata == nil) then
		return {};
	end

	return copyArray(metadata.recoveredMethods);
end

function helpers.getReferenceOnlyRecoveredDirectors(quest)
	local metadata = helpers.getReferenceOnlyQuestMetadata(quest, nil);
	if (metadata == nil) then
		return {};
	end

	return copyArray(metadata.recoveredDirectors);
end

function helpers.delegateEvent(player, owner, eventName, ...)
	return callClientFunction(player, "delegateEvent", player, owner, eventName, ...);
end

function helpers.delegateEventWithArgList(player, owner, eventName, args)
	return callClientFunction(player, "delegateEvent", player, owner, eventName, unpack(args or {}));
end

function helpers.delegateEventAndAdvance(player, quest, eventName, nextSequence, ...)
	local result = helpers.delegateEvent(player, quest, eventName, ...);
	if (nextSequence ~= nil) then
		quest:StartSequence(nextSequence);
	end

	return result;
end

function helpers.delegateEventWithArgListAndAdvance(player, quest, eventName, nextSequence, args)
	local result = helpers.delegateEventWithArgList(player, quest, eventName, args);
	if (nextSequence ~= nil) then
		quest:StartSequence(nextSequence);
	end

	return result;
end

function helpers.isQuestInfoAccepted(result)
	return result == true or tonumber(result) == 1;
end

-- Call before closing the source event or starting the battle coroutine.
-- If a watched after-warp movie outlived its reservation, release its fade at
-- the current position instead of transferring into a cancelled destination.
function helpers.commitQuestEntry(player, director, afterWarp)
	if (director:CommitQuestEntry(player)) then
		return true;
	end
	director:CancelQuestEntry();
	if (afterWarp and director:CanRecoverQuestEntryEvent(player)) then
		GetWorldManager():DoPlayerMoveInZone(player,
			player.positionX, player.positionY, player.positionZ, player.rotation, 0x11);
	end
	return false;
end

function helpers.getDirectorPlayerById(director, characterId)
	if (director == nil or characterId == nil) then return nil; end
	for _, member in pairs(director:GetPlayerMembers() or {}) do
		if (member ~= nil and member.Id == characterId
			and (member.HasConnectedSession == nil or member:HasConnectedSession())) then
			return member;
		end
	end
	return nil;
end

function helpers.isQuestInfoDeclined(result)
	return result == false or tonumber(result) == 2;
end

function helpers.delegateEventAndAdvanceIfAccepted(player, quest, eventName, nextSequence, ...)
	local result = helpers.delegateEvent(player, quest, eventName, ...);
	if (helpers.isQuestInfoAccepted(result) and nextSequence ~= nil) then
		quest:StartSequence(nextSequence);
	end

	return result;
end

function helpers.delegateSnpcEventAndAdvanceIfAccepted(player, quest, eventName, nextSequence, ...)
	local result = helpers.delegateSnpcEvent(player, quest, eventName, ...);
	if (helpers.isQuestInfoAccepted(result) and nextSequence ~= nil) then
		quest:StartSequence(nextSequence);
	end

	return result;
end

function helpers.getSnpcArgList(player)
	return {
		helpers.getSnpcNickname(player),
		helpers.getSnpcSkin(player),
		helpers.getSnpcPersonality(player),
		helpers.getSnpcCoordinate(player),
		helpers.getInitialTown(player),
	};
end

function helpers.getSnpcDelegateArgList(player)
	return helpers.getSnpcArgList(player);
end

function helpers.getSnpcDelegateArgListWithExtras(player, ...)
	return helpers.appendArgs(helpers.getSnpcDelegateArgList(player), ...);
end

function helpers.getSnpcReplayArgList(player)
	-- cutReplay placeholders line up with the cutscene-book SNPC tuple:
	-- nickname, skin, personality, coordinate, initial town. Replay clients
	-- convert the skin placeholder to actor class before direct SNPC scenes.
	return helpers.getSnpcArgList(player);
end

function helpers.getSnpcReplaySexualitySkin(player)
	return helpers.getSnpcSexualityToSkin(helpers.getSnpcPersonality(player, nil));
end

function helpers.getSnpcReplayArgListWithSexualitySkin(player)
	local args = helpers.getSnpcReplayArgList(player);
	args[#args + 1] = helpers.getSnpcReplaySexualitySkin(player);

	return args;
end

function helpers.getSnpcNickname(player, defaultValue)
	return getPlayerValue(player, function(target)
		return target:GetSNpcNickname();
	end, defaultValue);
end

function helpers.getSnpcSkin(player, defaultValue)
	return getPlayerValue(player, function(target)
		return target:GetSNpcSkin();
	end, defaultValue);
end

function helpers.getSnpcPersonality(player, defaultValue)
	return getPlayerValue(player, function(target)
		return target:GetSNpcPersonality();
	end, defaultValue);
end

function helpers.getSnpcCoordinate(player, defaultValue)
	return getPlayerValue(player, function(target)
		return target:GetSNpcCoordinate();
	end, defaultValue);
end

function helpers.getInitialTown(player, defaultValue)
	return getPlayerValue(player, function(target)
		return target:GetInitialTown();
	end, defaultValue);
end

function helpers.getDefaultSnpcArgList(player, nickname, skin, personality, coordinate)
	return {
		nickname or "???",
		skin or 1,
		personality or 1,
		coordinate or 1,
		helpers.getInitialTown(player),
	};
end

function helpers.delegateDefaultSnpcEvent(player, owner, eventName, ...)
	return helpers.delegateEventWithArgList(player, owner, eventName, helpers.appendArgs(helpers.getDefaultSnpcArgList(player), ...));
end

function helpers.getSnpcActorClassIdFromSkin(skin, defaultValue)
	local skinId = tonumber(skin);
	if (skinId == nil) then
		return defaultValue;
	end

	return 1070000 + skinId;
end

function helpers.getPlayerSnpcActorClassId(player, defaultValue)
	if (player == nil) then
		return defaultValue;
	end

	local ok, skin = pcall(function()
		return player:GetSNpcSkin();
	end);

	if (ok and skin ~= nil) then
		return helpers.getSnpcActorClassIdFromSkin(skin, defaultValue);
	end

	return defaultValue;
end

function helpers.getSnpcCutsceneArgList(player)
	return {
		helpers.getSnpcNickname(player),
		helpers.getSnpcActorClassIdFromSkin(helpers.getSnpcSkin(player)),
		helpers.getSnpcPersonality(player),
		helpers.getSnpcCoordinate(player),
		helpers.getInitialTown(player),
	};
end

function helpers.getSnpcCutsceneArgListWithExtras(player, ...)
	return helpers.appendArgs(helpers.getSnpcCutsceneArgList(player), ...);
end

function helpers.getSnpcCutsceneArgListWithSexualitySkin(player)
	local args = helpers.getSnpcCutsceneArgList(player);
	args[#args + 1] = helpers.getSnpcReplaySexualitySkin(player);

	return args;
end

function helpers.getMan402StartCutsceneArgList(player)
	return helpers.getSnpcCutsceneArgListWithSexualitySkin(player);
end

function helpers.getMan402P10DelegateArgList(player, flag)
	local value = flag;
	if (value == nil) then
		value = 1;
	end

	return helpers.getSnpcDelegateArgListWithExtras(player, value);
end

function helpers.getSnpcSexualityToSkin(personality)
	local value = tonumber(personality) or 1;
	if (value == 2 or value == 4 or value == 6 or value == 8) then
		return 2;
	end

	return 1;
end

function helpers.getQuestCompletionFlag(player, questId, defaultValue)
	local id = tonumber(questId);
	if (player == nil or id == nil) then
		return getDefault(defaultValue);
	end

	local ok, completed = pcall(function()
		return player:IsQuestCompleted(id);
	end);

	if (ok) then
		return completed and 1 or 0;
	end

	return getDefault(defaultValue);
end

function helpers.getManSnpcPreviewScene(quest, previewIndex, defaultScene)
	local questId = helpers.getQuestId(quest, nil);
	local scenes = MAN_SNPC_PREVIEW_SCENES[questId];
	if (scenes == nil) then
		return defaultScene;
	end

	local index = tonumber(previewIndex) or previewIndex;
	return scenes[index] or defaultScene;
end

function helpers.getManSnpcPreviewScenes(quest)
	local questId = helpers.getQuestId(quest, nil);

	return copyArray(MAN_SNPC_PREVIEW_SCENES[questId]);
end

function helpers.isManSnpcPreviewHqScene(sceneKey)
	return MAN_SNPC_PREVIEW_HQ_SCENES[sceneKey] == true;
end

function helpers.getManSnpcPreviewHqScenes(quest)
	local scenes = helpers.getManSnpcPreviewScenes(quest);
	local hqScenes = {};

	for _, scene in ipairs(scenes) do
		if (helpers.isManSnpcPreviewHqScene(scene)) then
			hqScenes[#hqScenes + 1] = scene;
		end
	end

	return hqScenes;
end

function helpers.getMan304PersonalityBucket(personality)
	local value = tonumber(personality) or 0;

	if (value == 1 or value == 2 or value == 9) then
		return 1;
	elseif (value == 3 or value == 4) then
		return 2;
	elseif (value == 5 or value == 6) then
		return 3;
	elseif (value == 7) then
		return 4;
	elseif (value == 8) then
		return 5;
	end

	return 0;
end

function helpers.getMan304StartCutsceneArgList(player)
	return helpers.getSnpcCutsceneArgListWithExtras(
		player,
		helpers.getMan304PersonalityBucket(helpers.getSnpcPersonality(player)),
		5,
		10
	);
end

function helpers.getMan304Pe30PersonalityRows(personality)
	return helpers.getPersonalityRows(personality, MAN304_PE30_PERSONALITY_ROWS);
end

function helpers.getPlayerMan304Pe30PersonalityRows(player)
	return helpers.getPlayerSnpcPersonalityRows(player, MAN304_PE30_PERSONALITY_ROWS);
end

function helpers.unpackMan304Pe30PersonalityRows(personality)
	return helpers.unpackPersonalityRows(personality, MAN304_PE30_PERSONALITY_ROWS);
end

function helpers.unpackPlayerMan304Pe30PersonalityRows(player)
	local rows = helpers.getPlayerMan304Pe30PersonalityRows(player);
	if (type(rows) == "table") then
		return unpack(rows);
	end

	return rows;
end

function helpers.getMan308OpeningRows(personality)
	return helpers.getPersonalityRows(personality, MAN308_PES_OPENING_ROWS);
end

function helpers.getPlayerMan308OpeningRows(player)
	return helpers.getPlayerSnpcPersonalityRows(player, MAN308_PES_OPENING_ROWS);
end

function helpers.unpackMan308OpeningRows(personality)
	return helpers.unpackPersonalityRows(personality, MAN308_PES_OPENING_ROWS);
end

function helpers.unpackPlayerMan308OpeningRows(player)
	local rows = helpers.getPlayerMan308OpeningRows(player);
	if (type(rows) == "table") then
		return unpack(rows);
	end

	return rows;
end

function helpers.getMan308AcceptedRows(personality)
	return helpers.getPersonalityRows(personality, MAN308_ACCEPTED_ROWS);
end

function helpers.getPlayerMan308AcceptedRows(player)
	return helpers.getPlayerSnpcPersonalityRows(player, MAN308_ACCEPTED_ROWS);
end

function helpers.unpackMan308AcceptedRows(personality)
	return helpers.unpackPersonalityRows(personality, MAN308_ACCEPTED_ROWS);
end

function helpers.unpackPlayerMan308AcceptedRows(player)
	local rows = helpers.getPlayerMan308AcceptedRows(player);
	if (type(rows) == "table") then
		return unpack(rows);
	end

	return rows;
end

function helpers.getMan308Pe20PersonalityRow(personality)
	return helpers.getPersonalityRows(personality, MAN308_PE20_PERSONALITY_ROWS);
end

function helpers.getPlayerMan308Pe20PersonalityRow(player)
	return helpers.getPlayerSnpcPersonalityRows(player, MAN308_PE20_PERSONALITY_ROWS);
end

function helpers.getMan406Pe01PersonalityRow(personality)
	return helpers.getPersonalityRows(personality, MAN406_PE01_PERSONALITY_ROWS);
end

function helpers.getPlayerMan406Pe01PersonalityRow(player)
	return helpers.getPlayerSnpcPersonalityRows(player, MAN406_PE01_PERSONALITY_ROWS);
end

function helpers.getMan406Pe52PersonalityRow(personality)
	return helpers.getPersonalityRows(personality, MAN406_PE52_PERSONALITY_ROWS);
end

function helpers.getPlayerMan406Pe52PersonalityRow(player)
	return helpers.getPlayerSnpcPersonalityRows(player, MAN406_PE52_PERSONALITY_ROWS);
end

function helpers.getMan406P50CutsceneArgList(player)
	return helpers.getSnpcCutsceneArgListWithExtras(player, helpers.getInitialTown(player));
end

function helpers.getMan406P60CutsceneArgList(player)
	return helpers.getSnpcCutsceneArgListWithSexualitySkin(player);
end

function helpers.getPersonalityRows(personality, rowsByPersonality, defaultRows)
	if (rowsByPersonality == nil) then
		return defaultRows;
	end

	local value = tonumber(personality) or personality;

	return rowsByPersonality[value] or defaultRows;
end

function helpers.getPlayerSnpcPersonalityRows(player, rowsByPersonality, defaultRows)
	return helpers.getPersonalityRows(helpers.getSnpcPersonality(player, nil), rowsByPersonality, defaultRows);
end

function helpers.unpackPersonalityRows(personality, rowsByPersonality, defaultRows)
	local rows = helpers.getPersonalityRows(personality, rowsByPersonality, defaultRows);
	if (type(rows) == "table") then
		return unpack(rows);
	end

	return rows;
end

function helpers.delegateSnpcEvent(player, owner, eventName, ...)
	return helpers.delegateEventWithArgList(player, owner, eventName, helpers.getSnpcDelegateArgListWithExtras(player, ...));
end

function helpers.delegateSnpcCutsceneEvent(player, owner, eventName, ...)
	return helpers.delegateEventWithArgList(player, owner, eventName, helpers.getSnpcCutsceneArgListWithExtras(player, ...));
end

function helpers.delegateSnpcEventAndAdvance(player, quest, eventName, nextSequence, ...)
	local result = helpers.delegateSnpcEvent(player, quest, eventName, ...);
	if (nextSequence ~= nil) then
		quest:StartSequence(nextSequence);
	end

	return result;
end

function helpers.delegateSnpcCutsceneEventAndAdvance(player, quest, eventName, nextSequence, ...)
	local result = helpers.delegateSnpcCutsceneEvent(player, quest, eventName, ...);
	if (nextSequence ~= nil) then
		quest:StartSequence(nextSequence);
	end

	return result;
end

function helpers.getActorClassId(npc)
	if (npc == nil) then
		return nil;
	end

	local ok, classId = pcall(function()
		return npc:GetActorClassId();
	end);

	if (ok) then
		return classId;
	end

	return nil;
end

function helpers.isActorClass(npc, actorClassId)
	return helpers.getActorClassId(npc) == actorClassId;
end

function helpers.getActorClassMappedValue(npc, valuesByActorClass, defaultValue)
	if (valuesByActorClass == nil) then
		return defaultValue;
	end

	local actorClassId = helpers.getActorClassId(npc);

	return valuesByActorClass[actorClassId] or defaultValue;
end

function helpers.delegateActorClassMappedEvent(player, owner, npc, eventsByActorClass, ...)
	local eventName = helpers.getActorClassMappedValue(npc, eventsByActorClass, nil);
	if (eventName == nil) then
		return nil;
	end

	return helpers.delegateEvent(player, owner, eventName, ...);
end

function helpers.getQuestData(quest)
	if (quest == nil) then
		return nil;
	end

	local ok, data = pcall(function()
		return quest:GetData();
	end);

	if (ok) then
		return data;
	end

	return nil;
end

function helpers.getQuestDataCounter(quest, index, defaultValue)
	local data = helpers.getQuestData(quest);
	if (data == nil) then
		return defaultValue or 0;
	end

	local ok, value = pcall(function()
		return data:GetCounter(index);
	end);

	if (ok and value ~= nil) then
		return value;
	end

	return defaultValue or 0;
end

function helpers.getQuestDataCounters(quest, count, defaultValue)
	local values = {};
	local maxCount = tonumber(count) or 0;

	for index = 0, maxCount - 1 do
		values[#values + 1] = helpers.getQuestDataCounter(quest, index, defaultValue);
	end

	return values;
end

function helpers.unpackQuestDataCounters(quest, count, defaultValue)
	return unpack(helpers.getQuestDataCounters(quest, count, defaultValue));
end

function helpers.getQuestDataFlag(quest, index, defaultValue)
	local data = helpers.getQuestData(quest);
	if (data == nil) then
		return defaultValue == true;
	end

	local ok, value = pcall(function()
		return data:GetFlag(index);
	end);

	if (ok and value ~= nil) then
		return value == true;
	end

	return defaultValue == true;
end

function helpers.getQuestSequence(quest)
	local ok, sequence = pcall(function()
		return quest:GetSequence();
	end);

	if (ok and sequence ~= nil) then
		return sequence;
	end

	ok, sequence = pcall(function()
		return quest:getSequence();
	end);

	if (ok) then
		return sequence;
	end

	return nil;
end

function helpers.getSequenceValues(player, quest, valuesBySequence)
	local sequence = helpers.getQuestSequence(quest);
	local values = {};

	if (valuesBySequence ~= nil) then
		local value = valuesBySequence[sequence];
		if (type(value) == "function") then
			value = {value(player, quest, sequence)};
		end
		appendValue(values, value);
	end

	return values;
end

function helpers.unpackSequenceValues(player, quest, valuesBySequence)
	return unpack(helpers.getSequenceValues(player, quest, valuesBySequence));
end

function helpers.getSequenceMarkerList(player, quest, markersBySequence)
	return helpers.getSequenceValues(player, quest, markersBySequence);
end

function helpers.unpackSequenceMarkers(player, quest, markersBySequence)
	return helpers.unpackSequenceValues(player, quest, markersBySequence);
end

function helpers.getPathCompanionJournalInfo(player, firstArg)
	return firstArg or 0, 0, 0, 0, 0, helpers.getSnpcNickname(player);
end

function helpers.getPathCompanionJournalInfoFromCounter(player, quest, counterIndex, defaultValue)
	local value = helpers.getQuestDataCounter(quest, counterIndex, defaultValue);

	return helpers.getPathCompanionJournalInfo(player, value);
end

function helpers.addCurrentClassExp(player, exp)
	local expReward = tonumber(exp) or 0;
	if (player == nil or expReward <= 0) then
		return false;
	end

	player:AddExp(expReward, player:GetCurrentClassOrJobId(), 0);
	return true;
end

function helpers.addGil(player, gil)
	local gilReward = tonumber(gil) or 0;
	if (player == nil or gilReward <= 0) then
		return false;
	end

	player:AddGil(gilReward);
	return true;
end

function helpers.completeQuest(player, quest)
	if (player == nil or quest == nil) then
		return false;
	end

	player:CompleteQuest(quest);
	return true;
end

function helpers.completeQuestWithRewards(player, quest, exp, gil)
	-- CompleteQuest can decline completion (for example, when rewards do not
	-- fit). Pay script-owned rewards only after the quest actually completes.
	if (player == nil or quest == nil or quest:GetSequence() == SEQ_COMPLETE) then
		return false;
	end
	helpers.completeQuest(player, quest);
	if (quest:GetSequence() ~= SEQ_COMPLETE) then
		return false;
	end
	helpers.addCurrentClassExp(player, exp);
	helpers.addGil(player, gil);
	return true;
end

function helpers.delegateQuestRewardWindow(player, quest, exp, ...)
	return helpers.delegateEvent(player, quest, "sqrwa", exp, ...);
end

function helpers.addItem(player, itemId, quantity)
	local item = tonumber(itemId) or itemId;
	local count = tonumber(quantity) or 1;
	if (player == nil or item == nil) then
		return false;
	end

	player:AddItem(item, count);
	return true;
end

function helpers.addItemWithAttention(player, itemId, quantity, messageId)
	local item = tonumber(itemId) or itemId;
	local count = tonumber(quantity) or 1;
	if (not helpers.addItem(player, item, count)) then
		return false;
	end

	attentionMessage(player, messageId or 25228, item, count);
	return true;
end

function helpers.sendNpcLsMessagePack(player, quest, messagePacks, packId, msgStep, senderDisplayName, completeMode)
	local packIndex = tonumber(packId) or packId;
	local step = tonumber(msgStep);
	local messagePack = nil;
	if (messagePacks ~= nil) then
		messagePack = messagePacks[packIndex];
	end

	if (messagePack == nil or step == nil or messagePack[step] == nil) then
		return nil;
	end

	if (type(senderDisplayName) == "number") then
		player:SendGameMessageLocalizedDisplayName(quest, messagePack[step], MESSAGE_TYPE_NPC_LINKSHELL, senderDisplayName);
	else
		player:SendGameMessageCustomDisplayName(quest, messagePack[step], MESSAGE_TYPE_NPC_LINKSHELL, tostring(senderDisplayName or ""));
	end

	local complete = step >= #messagePack;
	if (complete) then
		if (completeMode == "repeat") then
			quest:RepeatNpcLsMsg();
		else
			quest:EndOfNpcLsMsgs();
		end
	else
		quest:ReadNpcLsMsg();
	end

	return complete;
end

return helpers;
