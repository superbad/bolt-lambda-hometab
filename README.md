## Bolt Lambda Home Tab

This project serves as a baseline template for getting a bolt-python Slack app up and running in AWS Lambda. The app only has a Home Tab that can be further customized as a dashboard to present whatever data you want to the user.

### Setup:
- Customize the config to be correct for your deployment. Most likely you'll need to change at least the role and the region. It also expects that you have your SLACK_BOT_TOKEN and SLACK_SIGNING_SECRET in your environment variables.
- If you choose to create the lambda function manually you don't need to customize the config script correctly.
- Run the `deploy_lazy.sh` script from the bin directory. If you set up the config file, this will create the lambda function for you. If you dont, it still creates a zip file in /tmp/app-build/dist that you can upload manually.
- Double check that the lambda function has you SLACK_BOT_TOKEN and SLACK_SIGNING_SECRET in the Environment Variables section
- In the lambda configuration tab, click 'Add trigger', choose API Gateway, 'Create an API', API type: HTTP API, Security: Open. The default additional settings are fine but feel free to look further into them if you like.
- In your Slack App settings, find the Event Subscriptions section, enable Events, and put the API endpoint you just created in the Request Url. You have to add an event to subscribe to before it will let you save.
- Go down to 'Subscribe to events on behalf of users', click 'Add Workspace Event', and add "app_home_opened",
- Go to the 'App Home' section of the settings, scroll down to 'Show Tabs', and enable the Home Tab.