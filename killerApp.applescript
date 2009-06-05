on idle
	tell application "System Events"
		set theList to name of every process
	end tell
	if theList contains "ScreenSaverEngine" then
		set execptionList to {"Finder"}
		tell application "System Events" to set theList to name of every process whose background only is false
		repeat with x from 1 to count items of theList
			set theProcess to item x of theList
			if execptionList does not contain theProcess then
				tell application "System Events" to set thePID to (unix id of process theProcess)
				do shell script "kill " & thePID
			end if
		end repeat
		tell application "Finder" to close every window
	end if
	return 5
end idle

(* This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)