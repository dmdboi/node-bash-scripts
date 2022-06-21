# node-bash-scripts
A set of scripts for setting up a server to run a Node application using PM2 for the first time.

These scripts do the following:
- Install Node, PM2 and Nginx   
- Write an Nginx Server Block to the sites-available folder   
- Setup Github SSH using a Github Username and Access Token   
- Clone a Repository, install dependencies and deploy with PM2   

## Usage  
Host these with a cloud provider, personally I recommended an AWS S3 Bucket. 

These scripts can be called using ``curl`` from the terminal or from ``user_data`` during the creation of a [DigitalOcean Droplet](https://docs.digitalocean.com/products/droplets/how-to/provide-user-data/).

**Replace ... with the url to your cloud storage**
```bash
curl -s .../setup.sh  | bash -s
curl -s .../gitaccess.sh | bash -s github_username github_access_token
curl -s .../deploy.sh | bash -s server_user github_username github_repository
curl -s .../nginx.sh | bash -s app_domain app_port
```

``github_username`` => Github Username  
``github_access_token`` => Github Access Token  
``github_repository`` => Github Repository name  
``server_user`` => Name of the user to create on the server  
``app_domain`` => The domain name to set in the Nginx Server Block  
``app_port`` => The port the Node app runs on  