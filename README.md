# rblx-whoami
A script that is put into autoexec to make sure you know what account you're exploiting with.

# Usage
1. Download all sound files in `sounds/` and put them into your `workspace` folder.
**NOTE**: If you don't use Synapse X, skip this step.

2. Insert following code into any text editor.
```lua
_G.WHOAMI_BYPASS_USER_CHECK = false -- completely bypass all account checks
_G.WHOAMI_WHITELISTED = {}          -- UserIDs to skip modal
_G.WHOAMI_BLACKLISTED = {}          -- UserIDs to auto kick
_G.WHOAMI_INSECURE_ENABLED = false  -- enable features that can be detected by in-game anticheats

loadstring(game:HttpGet('https://raw.githubusercontent.com/DexTheExplorer/rblx-whoami/main/source.lua'))()

```

3. Adjust the tables and values to your liking. **It is recommended to blacklist any accounts that you don't want to exploit with and whitelist any accounts you often exploit with. Example:
```lua
_G.WHOAMI_BYPASS_USER_CHECK = false -- completely bypass all account checks
_G.WHOAMI_WHITELISTED = {1, 490165238}          -- UserIDs to skip modal
_G.WHOAMI_BLACKLISTED = {8, 625243748}          -- UserIDs to auto kick
_G.WHOAMI_INSECURE_ENABLED = false  -- enable features that can be detected by in-game anticheats
```

4. Save the file into your autoexec folder.

Congratulations. It should now work accordingly.
