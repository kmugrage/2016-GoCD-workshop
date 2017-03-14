# Digital Ocean API Key Environment Variable

Vagrant will need an API key from your Digital Ocean account in order to set up the GoCD server. We don't want that key in the Git repository where it might accidentally get pushed into a repository. The workshop is setup to read this value from an [environment variable](https://en.wikipedia.org/wiki/Environment_variable).

These instructions assume you're using the Bash shell. If you don't know what that means, then it's very likely this is correct as it's the default on most systems. (as a side note, [Bash is also available for Windows 10](https://msdn.microsoft.com/en-us/commandline/wsl/about) now)
