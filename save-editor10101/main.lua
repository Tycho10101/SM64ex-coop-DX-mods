-- name: Save Editor 10101 0.2
-- description: Save Editor 10101\nBy: Tycho10101\nVersion:0.2\nA WIP UI based save editor (no UI yet)\nWarning: UI not compatible with RomHacks

edit_save_file = 0

function on_setstar_command(msg)
	if edit_save_file == 0 then
		djui_chat_message_create("Save not selected. Use /choosesave to choose the save to edit.")
	else
		local args = {} -- split msg into table
		for argument in msg:gmatch("%S+") do table.insert(args, argument) end
	
		if #args == 2 then
			print(edit_save_file)
			print(args[1])
			print(args[2])
			save_file_set_star_flags(edit_save_file, args[1], args[2])
		else 
			djui_chat_message_create("Too many, or not enough arguments.")
		end
	end
return true
end

function on_choosesave_command(msg)
	if msg == "1" then
		djui_chat_message_create("Set Save# to " ..msg.. "!")
		edit_save_file = 1
	elseif msg == "2" then
		djui_chat_message_create("Set Save# to " ..msg.. "!")
		edit_save_file = 2
	elseif msg == "3" then
		djui_chat_message_create("Set Save# to " ..msg.. "!")
		edit_save_file = 3
	elseif msg == "4" then
		djui_chat_message_create("Set Save# to " ..msg.. "!")
		edit_save_file = 4
	else
		print(msg)
		djui_chat_message_create(msg.. " is not valid. (Save A=1, Save B=2, Save C=3, Save D=4)")
	end
print(edit_save_file)
return true
end

hook_chat_command('setstar', "[CourseIndex] [StarFlags?]", on_setstar_command)
hook_chat_command('choosesave', "[SaveNum(1-4)]", on_choosesave_command)