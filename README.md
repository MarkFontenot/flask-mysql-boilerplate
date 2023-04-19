# ShowerThoughts

ShowerThoughts is a social media platform for users to share the deep thoughts that they come up with in their most intimate moments: butt naked in the shower. ShowerThoughts is a text-only service that allows users to create and view posts from other users. Users with a certain number of post interactions are designated Shower Philosophers; these users can monetize their posts and have access to deeper analytics than the average user. A viewer’s post feed has advertisements included with the user-generated content; advertisers have access to post analytics similar to a Shower Philosopher, but they spend money to share their content instead of receiving it.

---

This repo contains a  setup for spinning up 3 Docker containers:

1. A MySQL 8 container, `db`
1. A Python Flask container, `web`
1. A Local AppSmith Server, `appsmith`

---

## How to setup and start the containers

**Important** - you need Docker Desktop installed

1. Clone this repository.  
2. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL.
3. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp.
4. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
5. Build the images with `docker compose build`
6. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`.
