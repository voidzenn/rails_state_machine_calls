# AASM | State Machines | Handle Model Status

### Pre-requisites
 - After pulling repo, run **bundle install**
 - Change the name of /config/application.yml.example to **application.yml**
 - You need to install docker, after installing docker, run mysql docker containers using this command **docker compose up -d**
 - Run migration **rails db:migrate**
 - Run migration **rake create_calls_data**
 - Run application **rails s**
 - Access localhost **http://127.0.0.1:3000/** or the generated url and port after running **rails s**

### Info
 - In the root page, you can see the different status, also the three buttons **Next Status**, **Cancel Call** and **Initialize Call**
 - In Call Status area, **Init** is the default state
 - If you click **Next Status**, you can proceed to next status which changes **Init** to **Calling**, then **Calling** to **Waiting** and so on
   - **Next Status** will be hidden if in **Cancelled** state
 - If you click **Cancel Call**, the call status will be **Cancelled_call** because the call has completed or rejected
   - **Cancel Call** button will be hidden if in **Init** state or **Cancelled** state
   - **Cancel Call** button will be shown if other state
 - If you click **Initialize Call**, the call status will be **Init** state which goes back to the first state
