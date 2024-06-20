# Deploy the Strapi API

## 🔗Fork this Repo link
👉 [https://github.com/Shubhamrahangdale/strapi].

# 🕜Requirement 
1.AWS account with ec2 t2.micro/t3.micro - (Ubuntu)

2.Github account

3.Gtrong connection network

## Steps For Strapi API on EC2 manually 

## setup & upgrade repository

 $ sudo apt update

 ## install Node.js-->  
 
 $ sudo apt install nodejs

## install Strapi--> 

 $ npm install -g strapi@latest

## create Strapi project

$ npx create-strapi-app strapi --quickstart
 
## Navigate to the project directory

$ cd strapi

Add 1337 as a port in inbound rule

## Start the Strapi server

$ npm run develop
  or
$ yarn develop

Add 1337 as a port in inbound rule 


## 👉Copy the public ip and paste it on browser with port number

so we  can see the sucessfully deployed with the help of manual deployment

## GitHub Actions Workflow (main.yml):

1. Trigger the workflow on push to the main branch.
2. Checkout the code.
3. Set up Node.js environment.
4. Set up strapi.
5. Install dependencies.
6. Build the application.
7. Decode and set up the SSH key.
8. Deploy to EC2.

# Explanation of Secrets

EC2_HOST: Your EC2 instance's public IP or DNS name.
EC2_KEY: The content of your PEM key file.
EC2_USER: The username for SSH access (e.g., ubuntu for Ubuntu instances).







