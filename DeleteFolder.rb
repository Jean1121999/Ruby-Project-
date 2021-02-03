#
#Description: The DeleteFolder.rb program deletes folders
#             after the user enters a folder name   
#Author: Jean Aime K Lukuka
#Original Date: 12/21/2020 9:16 PM
#Updated Date: 1/22/2021

class Screen

	def cls
		puts ("\n"*25) #Clears the screen
	end

	def pause
		STDIN.gets #Pauses until the user presses the enter key
	end
end

class Folder

	def delete_folder(folder_name)
		checkFile =  File.directory?(folder_name)
		if checkFile == true then
				Dir.delete(folder_name)
				puts "The folder has been deleted"
				puts "A log has been created in the file with the name below"
				log_file(folder_name)
				puts "#{Dir.glob("**/Folder Logs.txt")}"
		else
			puts "The file does not exist."
		end
	end

	def log_file(folder_name)
		logFile = File.open("Folder Logs.txt", "a")
			logFile.puts "Folder: #{folder_name} has been deleted"
			logFile.puts "Time: #{Time.now}"
			logFile.puts "-"*15
	end

end

#----Main Script

Console_Screen = Screen.new #Instansiate the Screen object

Delete = Folder.new #Instansiate the Folder object


puts "Are you trying to delete a folder?y/n "
$answer = STDIN.gets
$answer.chop!

while $answer !~ /[ynq]/i do
		puts "Invalid Entry. Please enter [y or n or q (to quit)]"
	  puts "Are you trying to delete a folder?y/n "
		$answer = STDIN.gets
		$answer.chop! # Removes the space in the beginning of the string
		break if $answer =~ /[ynq]/i
end

if $answer =~ /y/i then
	Console_Screen.cls
	puts "Enter the path of the folder: "
	puts "Ex: C:\\Users\\Document\\FolderToBeDeleted"
	ans = "" #Converts the user entry to a string
	ans = STDIN.gets
	ans.chop! # Removes the space in the beginning of the string

	Delete.delete_folder(ans) # Deletes the folder
elsif $answer =~ /[nq]/i then
	Console_Screen.cls
	puts "See you again!"
end
