--This program will act as a repeater between a turtle and a receiver computer
--[[ How it works
  First, it will startup, taking a list of channels to open in the argument
  Then it will begin waiting for messages.
  When it receives a message, it will check if the message is a table and has an id field.
  If does not have an id field it will create one, taking a random number from 1 to 2 billion.
  It checks if it has already sent this number.
  If it has not sent the number, it will add the id to two or one lists
    We could just have a list that is increasingly numbered with the ids, and go through all elements to check if sent
    Or we could have a list where [id] = true, and a numbered list. Lookups will be done on the first list, and the second will be used for periodic deletions.
  Then it will send the message along on the requested send channel.
  If it gets a char event instead of a message, it will prompt the user to add more channels to open.
  ]]
--expected message format: {message, id, distance}

local arbitraryNumber = 100 --How many messages to keep between deletions
local sentMessages = {} --Table of received message ids
local idMap = {} --List of random ids

local function newID()
  return math.random(1,2000000) --1 through 2 billion; close enough 
end

while true do
  local event, key, receivedFreq, replyFreq, received, dist = os.pullEvent()
  if event == "modem_message" then
    if not type(received) == "table" then
      received = { message = received, id = newID(), distance = dist}
    end
    sentMessages[id] = true
    table.insert(idMap, id)
    
  end
end