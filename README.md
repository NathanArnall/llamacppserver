# llamacppserver
Automatically start llama.cpp's llama-server with a simple interface to load models



<h3>Assumptions:</h3>

llama.cpp should be built in the home directory (~) of your user, built in a "build" directory (or modify the "~/./llama.cpp/build/bin/llama-server" string).

Models should be stored in the home directory/models (/models) of your user (or modify the "for f in ~/models/*; then" line).


<h3>To Do:</h3>

Add the option to include user defined custom parameters for anything additional such as thread count and tuned model settings.

Regex or similar filter to check for IP and Port misconfiguration. llama.cpp should error if this is not correct and will not run.

Check for ~/./llama.cpp/build/bin/llama-server and give an error output if it doesn't exist.
