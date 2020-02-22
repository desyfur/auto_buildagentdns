# auto_buildagentdns
Creates DNS entries for build server and build agents

Set the build IP depending on the IP address of your build server.

You should create two zone names for the projects build server and the build agents. 
The first zone name should be the build server, while the second zone name should be your build agents.
For example your DNS entry might be projectname.build.abc.com
In which case you would put "build.abc.com" in the first zone name.
With your build agents you might have a DNS entry of projectname.agents.abc.com
In which you should put "agents.abc.com" in the second zone name. 
