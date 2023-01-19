# node-bash-scripts
A set of scripts for setting up a server to run a Node application using PM2 for the first time.

These scripts do the following:
- Install Node, PM2 and Nginx   
- Write an Nginx Server Block to the sites-available folder   
- Setup Github SSH using a Github Username and Access Token   
- Clone a Repository and install dependencies
- Assign an SSL certificate using LetsEncrypt to the app's domain

## Usage
These scripts can be called using ``curl`` from the terminal or from ``user_data`` during the creation of a [DigitalOcean Droplet](https://docs.digitalocean.com/products/droplets/how-to/provide-user-data/).

**All scripts will throw an error if any variables are missing.**

```bash
curl -s scripts.maxdiamond.co.uk/node_init.sh  | bash -s [server_user]
curl -s scripts.maxdiamond.co.uk/gitaccess.sh | bash -s [github_username] [ghkey] [github_access_token]
curl -s scripts.maxdiamond.co.uk/clone_install.sh | bash -s [server_user] [github_username] [github_repository]
curl -s scripts.maxdiamond.co.uk/nginx_block.sh | bash -s [app_domain] [app_port]
curl -s scripts.maxdiamond.co.uk/letsencrypt.sh | bash -s [app_domain] [email_address]
```

``github_username``       => Github Username  
``github_access_token``   => Github Access Token  
``github_repository``     => Github Repository name  
``ghkey``                 => Name of SSH Key to create in GitHub account
``server_user``            => Name of the user to create on the server  

``app_domain``            => The domain name to set in the Nginx Server Block  
``app_port``              => The port the Node app runs on  