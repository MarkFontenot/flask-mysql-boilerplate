# Phase 3: MySQL + Dynamo Meals Boilerplate Project
Overview:
Our project is a food delivery and social media application, currently we support two types of users to interact with each other, consumers and chefs. The application includes a GitHub repository, which supports creating a post from the chef's end, searching for a post, as well as looking at placed orders. Our databse has 13 tables. We can only modify two tables, posts and orders and they are done by executing post.py and orders.py in our local appsmith.


This repo contains a boilerplate setup for spinning up 3 Docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API
1. A Local AppSmith Server

**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 





