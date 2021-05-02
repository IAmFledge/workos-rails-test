# Demo Application for WorkOS

"[WorkOS](https://workos.com/) is a set of building blocks for quickly adding enterprise features to your app. Get started fast and ship quickly with a market-proven solution for your customers."

Demo Rails app integrated to WorkOS for single sign on, initially with [Okta](https://www.okta.com/).

## Required ENV vars

WORKOS_SECRET_KEY

The Secret API key for WorkOS provided at: https://dashboard.workos.com/api-keys

WORKOS_CLIENT_ID

This is the Client ID (previously known as the Project ID) of your current environment. You will need this value to initiate authentication with WorkOS, found at: https://dashboard.workos.com/configuration

APP_DOMAIN

The base URL that the application is running on, used to build the callback URLs from WorkOS
