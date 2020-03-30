# complimentor-bot-v2
ComplimentorBot is a Flask app slackbot that can be invoked to generate random compliments for yourself and your team mates.

### Inspiration
The inspiration for this bot was a toy called the Insultinator I had when I was younger. As the name suggests, it generated silly insults such as, "You're a totally gross boring nerd." The memory of it gave me the idea for the concept of this slack bot.

### Setup
As of now, ComplimentorBot cannot be installed on other workspaces. When it is possible (hopefully soon), a button will appear on this github page that will direct you to authorize the app on your Slack workspace(s).

### What's next
The most important next step for ComplimentorBot is to get it deployment-ready for multiple workspaces. This will require resolving some slack permissions issues with the Slack API, configuring the bot to receive and store bot tokens for other workspaces (and recall the correct token for each incoming request), and making sure there are no security flaws in the host configurations and code for ComplimentorBot.
